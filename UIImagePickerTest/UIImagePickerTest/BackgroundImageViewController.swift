//
//  ViewController.swift
//  UIImagePickerTest
//
//  Created by Lisa J on 12/21/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class BackgroundImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    let controller = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
        
        
        present(controller, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {//imagepickercontroller is its own view controller
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //after you select soemthing in photo library
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    

}

