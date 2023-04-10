//
//  DetailScreenViewModel.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 10.04.2023.
//

import Foundation

class DetailScreenViewModel: ObservableObject {
    @Published var movieDetail: MovieDetail?

    let service: MoviesServiceable

    init(service: MoviesServiceable) {
        self.service = service
    }

    func getMovieDetail(with id: String) {
        Task(priority: .background) {
            let result = await service.fetchMovieByID(id)
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetail(detail: movieDetail)
                }
            }
        }
    }
}

struct MovieDetail {

    let detail: Movie

    var title: String {
        detail.title
    }

    var poster: String {
        detail.poster
    }

    var year: String {
        detail.year
    }

    var imdbID: String {
        detail.imdbID
    }

    var director: String {
        detail.director
    }

    var writer: String {
        detail.writer
    }

    var awards: String {
        detail.awards
    }

    var plot: String {
        detail.plot
    }
}
