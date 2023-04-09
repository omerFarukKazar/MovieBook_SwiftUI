//
//  SAFetchedImageView.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 9.04.2023.
//

import SwiftUI

struct MBFetchedImageView: View {
    // MARK: - Properties
    let url: String
    @ObservedObject var imageDownloaderClient = DataDownloader()

    // MARK: - Init
    init(url: String)  {
        self.url = url
        self.imageDownloaderClient.downloadDataWith(url)
    }

    // MARK: - Body
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedData,
           let image = UIImage(data: data) {
            Image(uiImage: image)
                .resizable()
        } else {
            Image("placeholder")
                .resizable()
        }
    }
}

struct SAFetchedImageView_Previews: PreviewProvider {
    static var previews: some View {
                MBFetchedImageView(url: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")
    }
}
