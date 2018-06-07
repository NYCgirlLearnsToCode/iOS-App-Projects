//
//  ViewController.swift
//  URLSessionNasa
//
//  Created by Lisa J on 12/1/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var nasaObject: NASAObject? {
        didSet{
            if let nasaObject = nasaObject {
                self.titleLabel.text = nasaObject.title
                loadImage(from: nasaObject.hdurl ?? nasaObject.url)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
    }
    
    @IBAction func loadImageButtonPressed(_ sender: Any) {
        let selectedDate = datePicker.date
        let longDescription = selectedDate.description
        let ymd = longDescription.components(separatedBy: " ")[0]
        loadObject(for: ymd)
    }
    
    func loadImage(from urlStr: String) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let onlineNASAObject = try JSONDecoder().decode(NASAObject.self, from: data)
                self.nasaObject = onlineNASAObject
            }
            catch {
                print(error)
            }
        }
        let mySession = URLSession(configuration: .default)
        mySession.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                if let error = error {
                    print(error)
                    return//if u have an error, handle error and stop
                }
                guard let onlineImage = UIImage(data: data) else { return }
                self.imageView.image = onlineImage
                self.imageView.setNeedsLayout()
            }
            }.resume()
    }
    
    func loadObject(for YMD: String) {
        let myKey = "3DV2I17Q7KdmdBzNKqPMC90IcdseymqGIGp7PZQ5"
        let str = "https://api.nasa.gov/planetary/apod?date=\(YMD)&api_key=\(myKey)"
        guard let url = URL(string: str) else {return}
//        let mySession = URLSession(configuration: .default)
//        let completion: (Data?, URLResponse?, Error?) -> Void = {
//            (data: Data?, response: URLResponse?, error: Error?) in
//            DispatchQueue.main.async {
//                guard let data = data else {return}
//                if let error = error {
//                    print(error)
//                }
//                do {
//                    let onlineNASAObject = try JSONDecoder().decode(NASAObject.self, from: data)
//                    self.nasaObject = onlineNASAObject
//                }
//                catch {
//                    print(error)
//                }
//            }
//        }
//        let myTask = mySession.dataTask(with: url, completionHandler: completion)
//        myTask.resume()
        NetworkHelper.manager.performDataTask(with: <#T##URL#>, completionHandler: <#T##(Data) -> Void#>, errorHandler: <#T##(Error) -> Void#>)
    }
}





