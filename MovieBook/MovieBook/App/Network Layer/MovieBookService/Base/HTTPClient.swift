//
//  HTTPClient.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import Foundation

/// Sends the request to server and handles the possible responses
protocol HTTPClient {
    /**
     Sends a request to constructed URL with the given parameters.

     - parameters:
        - endpoint:: An Endpoint conformable parameter to build URL with the given endpoint variables.
        - responseModel:: Expected response model to decode returned model from api call.
     - returns: Returns a Result with either model of the given type or an error.
     - warning: While building url, appended **apikey** at the end of the url manually as query item.

     # Example #
     ```
     // func sendRequest<T: Movie>(endpoint: MoviesEndpoint,
     responseModel: Movie.self) async -> Result<Movie, RequestError>
     ```
     */
    func sendRequest<T: Decodable>(endpoint: Endpoint,
                                   responseModel: T.Type) async -> Result<T, RequestError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint,
                                   responseModel: T.Type) async -> Result<T, RequestError> {
        // build url from given endpoint variables
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems
        urlComponents.queryItems?.append(URLQueryItem(name: "apikey", value: "fdf408e3")) // append api key

        guard let url = urlComponents.url else {
            return.failure(.invalidURL)
        }

        // build urlRequest
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body,
                                                           options: [])
        }

        do {
            // begin URLSession
            let (data, response) = try await URLSession.shared.data(for: request,
                                                                    delegate: nil)
            // Handle possible responses
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel,
                                                                      from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 300...399:
                return .failure(.redirection)
            case 400...499:
                return .failure(.clientError)
            case 500...599:
                return .failure(.serverError)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
