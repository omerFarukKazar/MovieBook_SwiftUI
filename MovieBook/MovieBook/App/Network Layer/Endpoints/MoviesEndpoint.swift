//
//  MoviesEndpoint.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import Foundation

/// Different Endpoint types for different Movie operations
enum MoviesEndpoint {
    case withID(_ id: String)
    case withTitle(_ title: String)
}

extension MoviesEndpoint: Endpoint {
    // Conforming the Endpoint protocol
    var method: HTTPMethod {
        .get
    }

    var path: String {
        ""
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .withID(let id):
            return ["i": id].toQuery
        case .withTitle(let title):
            return ["t": title].toQuery
        }
    }
}
