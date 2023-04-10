//
//  ContentView.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import SwiftUI

struct MainScreenView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: MainScreenViewModel
    @State var searchTextInput: String = ""

    // MARK: - Init
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type to search",
                          text: $searchTextInput)
                .onChange(of: searchTextInput) { newValue in
                    if newValue.count > 2 {
                        self.viewModel.searchMovieBy(title: newValue)
                    }
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

                List(viewModel.searchResults,
                     id: \.imdbID) { movie in
                    NavigationLink(destination: {
                        DetailScreenView(imdbID: movie.imdbID)
                    }, label: {
                        HStack {
                            MBFetchedImageView(url: movie.poster)
                                .frame(width: 100,
                                       height: 150)

                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .foregroundColor(.blue)
                                Text(movie.year)
                                    .foregroundColor(.orange)
                            }
                        }
                    })
                } 
            }
            .navigationTitle(Text("MovieBook"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let service = MoviesService()
        let viewModel = MainScreenViewModel(service: service)
        MainScreenView(viewModel: viewModel)
    }
}
