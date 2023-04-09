//
//  MainScreenViewModel.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import Foundation

class MainScreenViewModel: ObservableObject {
    // MARK: Properties
    let service: MoviesServiceable
    @Published var searchResults: [Search] = []

    // MARK: Init
    init(service: MoviesServiceable) {
        self.service = service
    }

    // TODO: Dummy method to test API Call. Remove or Update in the future.
    func fetchMovie(by id: String) {
        Task(priority: .background) {
            let result = await service.fetchMovieByID(id)
            switch result {
            case .success(let movieResponse):
                print(movieResponse)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func searchMovieBy(title: String) {
        Task(priority: .background) {
            let result = await service.searchMovieBy(title)
            switch result {
            case .success(let movieResponse):
                DispatchQueue.main.async {
                    self.searchResults = movieResponse.search
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
