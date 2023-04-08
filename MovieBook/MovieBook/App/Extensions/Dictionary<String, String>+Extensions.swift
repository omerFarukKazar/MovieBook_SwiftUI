//
//  File.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import Foundation

extension Dictionary<String, String> {
    /// Returns the corresponding _[URLQueryItem]_ for the current dictionary.
    var toQuery: [URLQueryItem] {

        var tempQuery: [URLQueryItem] = []

        self.forEach { key, value in
            tempQuery.append(URLQueryItem(name: key, value: value))
        }

        return tempQuery
    }
}
