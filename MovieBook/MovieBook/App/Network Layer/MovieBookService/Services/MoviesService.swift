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
        - id:: id of the movie which is wanted to fetched.
     - returns: Returns a **Result** with either **Movie** or a **RequestError**.
     - warning: While building url, appended **apikey** at the end of the url manually as query item.
     */
    func fetchMovieByID(_ id: String) async -> Result<Movie,
                                                  RequestError>
    /**
     Sends a fetch movie request with the desired movie's **title**.

     - parameters:
        - title:: title of the movie which is wanted to fetched.
     - returns: Returns a **Result** with either **Movie** or a **RequestError**.
     - warning: While building url, appended **apikey** at the end of the url manually as query item.
     */
    func fetchMovieByTitle(_ title: String) async -> Result<Movie,
                                                        RequestError>

    /**
     Sends a fetch search results request with the given **title**.

     - parameters:
        - title:: title of the movie which is wanted to fetched.
     - returns: Returns a **Result** with either **SearchResponse** or a **RequestError**.
     - warning: While building url, appended **apikey** at the end of the url manually as query item.
     */
    func searchMovieBy(_ title: String) async -> Result<SearchResponseModel,
                                                     RequestError>

}

struct MoviesService: HTTPClient, MoviesServiceable {

    func fetchMovieByID(_ id: String) async -> Result<Movie, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.withID(id),
                                 responseModel: Movie.self)
    }

    func fetchMovieByTitle(_ title: String) async -> Result<Movie, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.withTitle(title),
                                 responseModel: Movie.self)
    }

    func searchMovieBy(_ title: String) async -> Result<SearchResponseModel, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.searchWith(title),
                                 responseModel: SearchResponseModel.self)
    }

}
