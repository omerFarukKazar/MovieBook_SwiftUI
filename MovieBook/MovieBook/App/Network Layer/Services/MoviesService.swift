//
//  MoviesService.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import Foundation

protocol MoviesServiceable {
    /**
     Sends a fetch movie request with the desired movie's **id**.

     - parameters:
        - id:: id of the movie which is wanted to download.
     - returns: Returns a **Result** with either **Movie** or a **RequestError**.
     - warning: While building url, appended **apikey** at the end of the url manually as query item.
     */
    func getMovieByID(id: String) async -> Result<Movie,
                                                  RequestError>
    /**
     Sends a fetch movie request with the desired movie's **title**.

     - parameters:
        - title:: title of the movie which is wanted to download.
     - returns: Returns a **Result** with either **Movie** or a **RequestError**.
     - warning: While building url, appended **apikey** at the end of the url manually as query item.
     */
    func getMovieByTitle(title: String) async -> Result<Movie,
                                                        RequestError>

}

struct MoviesService: HTTPClient, MoviesServiceable {

    func getMovieByID(id: String) async -> Result<Movie, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.withID(id),
                                 responseModel: Movie.self)
    }

    func getMovieByTitle(title: String) async -> Result<Movie, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.withTitle(title),
                                 responseModel: Movie.self)
    }

}
