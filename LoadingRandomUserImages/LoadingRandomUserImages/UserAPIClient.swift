//
//  UserAPIClient.swift
//  LoadingRandomUserImages
//
//  Created by Lisa J on 11/28/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
struct UserAPIClient {
    private init() {}
    static let manager = UserAPIClient()
    func getUsers(from urlStr: String,
                  completionHandler: @escaping ([ResultsWrapper]) -> Void,
                  errorHandler: @escaping (AppError) -> Void) {
        guard let url = URL(string: urlStr) else {
            errorHandler(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let userInfo = try JSONDecoder().decode(UserInfo.self, from: data)
                let users = userInfo.results
                completionHandler(users)
            } catch {
                errorHandler(.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
