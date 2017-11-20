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

    @IBAction func action(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "The 5 seconds are up!"
        content.subtitle = "They are up now!"
        content.body = "The 5 seconds are really up!"
        content.badge = 1
        
        //let trigger = UNTimeIntervalNotificationTrigger(t)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

