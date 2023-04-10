//
//  DetailScreenView.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 10.04.2023.
//

import SwiftUI

struct DetailScreenView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = DetailScreenViewModel(service: MoviesService())

    let imdbID: String

    var body: some View {
        VStack(alignment: .leading, content: {
            HStack {
                Spacer()
                MBFetchedImageView(url: viewModel.movieDetail?.poster ?? "")
                    .frame(width: 250,
                           height: 300,
                           alignment: .center)
                Spacer()
            }

            HStack {
                Spacer()
                Text(viewModel.movieDetail?.title ?? "Movie Name Not Found")
                    .font(.title)
                    .foregroundColor(.blue)

                Text("( \(viewModel.movieDetail?.year ?? " ---- ") )")
                Spacer()
            }
            .padding()

            HStack {
                Spacer()
                Text("Director(s): \(viewModel.movieDetail?.director ?? "Director Not Found")")
                    .font(.title2)
                    .foregroundColor(.orange)
                Spacer()
            }

            HStack {
                Spacer()
                Text("Writer(s): \(viewModel.movieDetail?.writer ?? "Writer")")
                    .padding(.bottom)
                    .foregroundColor(.orange)
                Spacer()
            }

            Text("Plot: \(viewModel.movieDetail?.plot ?? "Plot Not Found")")
                .padding(.bottom, 4.0)

            Text("Awards: \(viewModel.movieDetail?.awards ?? "Awards")")
                .padding(.bottom, 4.0)
            Spacer()
        })
        .onAppear {
            self.viewModel.getMovieDetail(with: imdbID)
        }
    }

}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView(imdbID: "test")
    }
}

