//
//  SettingsViewController.swift
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
    
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize Notification Prompt at startup
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        //Create DatePicker
        createDatePicker()
    }
    
    //MARK: Notificiation Time
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
    
    //Done Button
    @objc func donePressed() {
        
        //format time
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: datePicker.date)
        
        datePickerTxt.text = "\(dateString)"
        self.view.endEditing(true)
        
        //clockNotification()
    }
    
    //MARK: Button Toggle
    @IBAction func thirtyMin(_ sender: UIButton) {
        
        //Call the Clock Notification
        clockNotification()
    }
    
    //Function that notifies the user at specified time set.
    func clockNotification() {
        //Extracting time from UIDatePicker and setting Date Components
        let components = Calendar.current.dateComponents([.hour, .minute], from: datePicker.date)
        var time = DateComponents()
        time.hour = components.hour!
        time.minute = components.minute!
        
        //Notify user based on time-set
        let content = UNMutableNotificationContent()
        content.title = "Please conduct one quiz!"
        content.badge = 1
        
        //Set notification at clock time
        let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: false)
        let request = UNNotificationRequest(identifier: "clockTime", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        //sleep(time)
        
        //Call Timed Notification
        timedNotification(inSeconds: 10) { (success) in
            if success {
                print("Successfully Notified")
            }
        }
    }
    
    //MARK: Notification Frequency
    func timedNotification(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        
        //Set Trigger and Content for buttons
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "Please conduct one quiz!"
        content.badge = 1
        
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

