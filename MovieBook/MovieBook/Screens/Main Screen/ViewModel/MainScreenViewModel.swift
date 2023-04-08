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
    func printResponse() {
        Task(priority: .background) {
          let result = await service.getMovieByID(id: "tt3896198")
          switch result {
          case .success(let movieResponse):
              print(movieResponse)
          case .failure(let error):
              print(error)
          }
        }
    }
}
