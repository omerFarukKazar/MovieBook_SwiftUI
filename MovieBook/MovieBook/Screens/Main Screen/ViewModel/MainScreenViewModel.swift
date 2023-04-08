//
//  MainScreenViewModel.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import Foundation

struct MainScreenViewModel {
    // MARK: Properties
    let service: MoviesServiceable

    // MARK: Init
    init(service: MoviesServiceable) {
        self.service = service
    }

    // MARK: Methods
    // TODO: This is a Dummy Method, Remove or Change this in future
    func printResponse() {
        Task(priority: .background) {
          let result = await service.getMovieByID("tt3896198")
          switch result {
          case .success(let movieResponse):
              print(movieResponse)
          case .failure(let error):
              print(error)
          }
        }
    }
    
    // TODO: This is a Dummy Method, Remove or Change this in future
    func searchMovie() {
        Task(priority: .background) {
          let result = await service.searchMovieBy(title: "James")
          switch result {
          case .success(let movieResponse):
              print(movieResponse)
          case .failure(let error):
              print(error)
          }
        }
    }
}
