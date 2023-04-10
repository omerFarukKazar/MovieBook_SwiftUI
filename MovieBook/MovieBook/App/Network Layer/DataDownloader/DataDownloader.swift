//
//  ImageDownloader.swift
//  MovieBook
//
//  Created by Ömer Faruk Kazar on 8.04.2023.
//

import Foundation

protocol DataDownloadable {
    func downloadDataWith(_ url: String)
}

class DataDownloader: DataDownloadable,
                      ObservableObject {

    // MARK: - Property
    /// Property to observe changes and pass the downloaded data.
    @Published var downloadedData: Data?

    // MARK: - Method
    /**
     Downloads the data on the given url string.

     - parameters:
     - url:: URL of the data which is wanted to download.
     - warning: Returns nothing but if download is success, adds that data to 'downloadedData' property in the same class.
     */
    func downloadDataWith(_ url: String) {

        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data,
                  error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
