//
//  ViewController.swift
//  pushNotifsTest
//
//  Created by Lisa J on 3/14/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    private var userPickedDate: Date!
    private var notifIdentifier = ""
    private var unNotificationcenter : UNUserNotificationCenter!
    private var alarmTime: TimeInterval = 0
    private var oneMinLater: TimeInterval = 120
    //time interval is always in seconds
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
       //ask user for permission to notifs
        unNotificationcenter = UNUserNotificationCenter.current()
        unNotificationcenter.delegate = self
        unNotificationcenter.requestAuthorization(options: [.alert, .sound])
            {(granted, error) in
                if let error = error {
                    print("request access error: \(error)")
                } else {
                    print("access granted")
                }
            
        }
    }
    
    @IBAction func tenSeconds(_ sender: UIButton) {
        alarmTime = 10.0
        print("alarmTime:\(alarmTime)")
        print("notifIdentifier\(notifIdentifier)")
    }
    @IBAction func fifteenSeconds(_ sender: UIButton) {
        alarmTime = 15.0
        print("alarmTime:\(alarmTime)")
        print("notifIdentifier:\(notifIdentifier)")
    }
    @IBAction func twentySeconds(_ sender: UIButton) {
        alarmTime = 20.0
        triggerTimeNotification(identifier: textField.text!)
        //notifIdentifier = textField.text!
        print("alarmTime:\(alarmTime)")
         print("notifIdentifier\(notifIdentifier)")
    }
    
    @IBAction func printPendingNotifs(_ sender: Any) {
        var displayString = "Current Pending Notifications "
        UNUserNotificationCenter.current().getPendingNotificationRequests {
            (requests) in
            displayString += "count:\(requests.count)\t"
            for request in requests{
                displayString += request.identifier + "\t"
            }
            print(displayString)
        }
    }
    @IBAction func dateAndTimePicker(_ sender: UIDatePicker) {
        let date = datePicker.date
        print(date)
    }
    private func triggerTimeNotification(identifier: String) {
        //create content for notif msg
        let content = UNMutableNotificationContent()
        content.title = "Notification!"
        content.body = "\(identifier)Notif is working, alarmTime:\(alarmTime)"
        content.sound = UNNotificationSound.default()
        //date
        userPickedDate =  datePicker.date
        let date = userPickedDate
        let currentDate = Date()
        let oneMinLaterInterval = (date?.timeIntervalSince(currentDate))! - oneMinLater
        let dateOneMinLater = currentDate.addingTimeInterval(oneMinLaterInterval)
        print("dateOneMinLater", dateOneMinLater)
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date!)
        let triggerDateOneMin = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateOneMinLater)
        
        //configure trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let triggerOneMin = UNCalendarNotificationTrigger(dateMatching: triggerDateOneMin, repeats: false)
        //create request
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        let newIdentifier = "\(identifier)1"
        let requestAfter1Min = UNNotificationRequest(identifier: newIdentifier, content: content, trigger: triggerOneMin)
        //sched request
        unNotificationcenter.add(request) {(error) in
            if let error = error {
                print("request error: \(error)")
            } else {
                print("scheduled")
            }
            
        }
        unNotificationcenter.add(requestAfter1Min){(error) in
            if let error = error {
                print("request error: \(error)")
            } else {
                print("scheduled")
            }
            
        }
    }
    
}
extension ViewController: UNUserNotificationCenterDelegate {
    //allows app notifs in app
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound])
    }
}
extension ViewController: UITextFieldDelegate {

}

