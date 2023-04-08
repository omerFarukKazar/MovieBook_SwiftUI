//
//  MovieBookApp.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import SwiftUI

@main
struct MovieBookApp: App {
    var body: some Scene {
        WindowGroup {
            let service = MoviesService()
            let viewModel = MainScreenViewModel(service: service)
            MainScreenView(viewModel: viewModel)
        }
    }
}
