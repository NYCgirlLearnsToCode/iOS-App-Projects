//
//  ViewController.swift
//  NotificationCenter+ScrollView+Gesture
//
//  Created by Lisa J on 1/16/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class CaptionViewController: UIViewController {
    
    let captionView = CaptionView()
    var longPressGesture = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        addSubviews()
        configureConstraints()
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureHandler))
        captionView.imageView.isUserInteractionEnabled = true
        captionView.imageView.addGestureRecognizer(longPressGesture)
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardShowing(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardHiding(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    func addSubviews() {
        view.addSubview(captionView)
    }

    func configureConstraints() {
        let safeGuide = view.safeAreaLayoutGuide
        captionView.translatesAutoresizingMaskIntoConstraints = false
        captionView.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        captionView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
        captionView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        captionView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
    }
    
    @objc func longPressGestureHandler(recognizer:UIPinchGestureRecognizer){
        switch recognizer.state {
        case .began:
            UIView.animate(withDuration: 0.05,
                           animations: {
                            self.captionView.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            },
                           completion: nil)
        case .ended:
            UIView.animate(withDuration: 0.05) {
                self.captionView.imageView.transform = CGAffineTransform.identity
            }
        default: break
        }
    }
    
    
    @objc func handleKeyboardShowing(sender notification: Notification) {
        guard let infoDict = notification.userInfo else { return }
        guard let rectFrame = infoDict[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        guard let duration = infoDict[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        captionView.moveFramesToAccomodateKeyboard(with: rectFrame, and: duration)
    }
    
    @objc func handleKeyboardHiding(sender notification: Notification) {
        guard let infoDict = notification.userInfo else { return }
        guard let duration = infoDict[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        captionView.moveFramesToAccomodateKeyboard(with: CGRect.zero, and: duration)
    }
}
