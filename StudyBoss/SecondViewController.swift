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
    
    //MARK: Notification Time Options
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
    }
    
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
     
 */

}

