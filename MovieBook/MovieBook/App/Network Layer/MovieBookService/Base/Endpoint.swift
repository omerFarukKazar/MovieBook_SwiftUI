//
//  Endpoint.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import Foundation

/// Endpoint items for a request
protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "omdbapi.com"
    }

    var header: [String: String]? {
        return nil
    }

    var body: [String: String]? {
        return nil
    }
}
