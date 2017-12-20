//
//  GoogleBook.swift
//  Unit4Week1
//
//  Created by Lisa J on 12/18/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct GoogleBook: Codable {
    let items: [GoogleBookWrapper]
}

struct GoogleBookWrapper: Codable {
    let searchInfo: GoogleBookShortWrapper?
    let volumeInfo: GoogleBookInfoWrapper
    let description: String?
}

struct GoogleBookInfoWrapper: Codable {
    let imageLinks: ImageInfo
}

struct ImageInfo: Codable {
    let smallThumbnail: String
    let thumbnail: String
}

struct GoogleBookShortWrapper: Codable {
    let textSnippet: String
}

class GoogleBookAPIClient {
    private init () {}
    static let manager = GoogleBookAPIClient()
    func getBooks(from urlStr: String, completionHandler: @escaping ([GoogleBookWrapper]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else  {return}
        let request = URLRequest(url:url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let allResults = try JSONDecoder().decode(GoogleBook.self, from: data)
                let books = allResults.items
                //if let books = books {
                completionHandler(books)
               // }else{
            } catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
    }
}
//https://www.googleapis.com/books/v1/volumes?q=+isbn:0553391836&key=AIzaSyC0gXsDAwd_ZgTpuIk2Q6eXkayukvRT7R0
