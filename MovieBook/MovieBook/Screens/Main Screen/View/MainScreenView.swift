//
//  ContentView.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import SwiftUI

struct MainScreenView: View {
    let viewModel: MainScreenViewModel

    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            // TODO: This is a Dummy Button, Remove or Change this in future
            Button("Fetch movie") {
                viewModel.printResponse()
            }
            // TODO: This is a Dummy Button, Remove or Change this in future
            Button("Search movie") {
                viewModel.searchMovie()
            }
        }
        .padding()
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let service = MoviesService()
        let viewModel = MainScreenViewModel(service: service)
        MainScreenView(viewModel: viewModel)
    }
}
