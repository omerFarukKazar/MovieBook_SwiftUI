//
//  RequestError.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import Foundation

/// Error types that's possible to occur in request process
enum RequestError: Error {

    case decode
    case invalidURL
    case noResponse
    case redirection
    case clientError
    case serverError
    case unexpectedStatusCode
    case unknown

    var errorMessage: String {
        switch self {
        case .decode:
            return "Decode Error"
        case .invalidURL:
            return "Invalid URL"
        case .noResponse:
            return "No Response"
        case .redirection:
            return "Redirection"
        case .clientError:
            return "Client Error"
        case .serverError:
            return "Server Error"
        case .unexpectedStatusCode:
            return "Unexpected status code"
        case .unknown:
            return "Unknown"
        }
    }
}
