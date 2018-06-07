//
//  HoroscopeAPIClient.swift
//  HoriOScope
//
//  Created by Lisa J on 12/11/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class HoroscopeAPIClient {
    private init() {}
    static let manager = HoroscopeAPIClient()
    //    func getHoroscopes(from urlStr: String, completionHandler: @escaping (Horoscope) -> Void, errorHandler: @escaping (Error) -> Void ){
    //        guard let url = URL(string: urlStr) else {return}
    //        let myRequest = URLRequest(url:url)
    //        let completion: (Data) -> Void = {(data: Data) in
    //            do {
    //                let onlineHoroscopes = try JSONDecoder().decode(Horoscope.self, from: data)
    //                completionHandler(onlineHoroscopes)
    //            } catch let error {
    //                errorHandler(error)
    //            }
    //        }
    //        NetworkHelper.manager.performDataTask(with: myRequest, completionHandler: completion, errorHandler: errorHandler)
    //    }
    func post(url: String,completionHandler:@escaping (Horoscope) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //no need fr request.addvalue bc we r not posting anything
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let onlineHoroscopes = try JSONDecoder().decode(Horoscope.self, from: data)
                completionHandler(onlineHoroscopes)
            } catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion , errorHandler: errorHandler)
    }
    
}

