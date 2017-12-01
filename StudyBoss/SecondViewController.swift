//
//  SecondViewController.swift
//  StudyBoss
//
//  Created by Brandon Wong on 9/26/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit
import UserNotifications

class SecondViewController: UIViewController {
    
    //MARK: Clock Toggle
    @IBOutlet weak var datePickerTxt: UITextField!
    
    let datePicker = UIDatePicker()
    
    //MARK: Notification Frequency
    @IBAction func thirtyMin(_ sender: Any) {
    }
    
    @IBAction func fourtyFiveMin(_ sender: Any) {
    }
    
    @IBAction func sixtyMin(_ sender: Any) {
    }
    
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize Notification Prompt at startup
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        //Create DatePicker
        createDatePicker()
    }
    
    //MARK: Clock Function
    func createDatePicker() {
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button for toolbar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        datePickerTxt.inputAccessoryView = toolbar
        
        //assigning date picker to text field
        datePickerTxt.inputView = datePicker
        
        //format picker for time
        datePicker.datePickerMode = .time
    }
    
    @objc func donePressed() {
        
        //format time
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        let dateString = formatter.string(from: datePicker.date)
        
        datePickerTxt.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    /*//MARK: Notification Time Options
     //Note intervals for showcasing is 1-3 minutes
     //Note that for repeats to be true, time interval must be at least 60 or greater
     @IBAction func Option_1(_ sender: Any) {
     //Option 1
     let content = UNMutableNotificationContent()
     content.title = "Please conduct one quiz!"
     content.badge = 1
     
     //Setting 1 minute for first slider
     let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
     let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
     
     UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
     }
     
     @IBAction func Option_2(_ sender: Any) {
     //Option 2
     let content = UNMutableNotificationContent()
     content.title = "Please conduct one quiz!"
     content.badge = 1
     
     //Setting 2 minutes for second slider
     let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (2*60), repeats: true)
     let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
     
     UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
     }
     
     @IBAction func Option_3(_ sender: Any) {
     //Option 3
     let content = UNMutableNotificationContent()
     content.title = "Please conduct one quiz!"
     content.badge = 1
     
     //Setting 3 minutes for third slider
     let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (3*60), repeats: true)
     let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
     
     UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
     }*/

}

