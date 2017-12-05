//
//  Card.swift
//  StudyBoss
//
//  Created by Andrew Millard on 11/19/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//
import UIKit
class Card: NSObject{
    //Mark: Properties
    var front: String
    var back: String
    //MARK: Initialization
    init?(front: String, back: String) {
        /*
        if (front.isEmpty || back.isEmpty){
            return nil
        }
    */
        self.front = front
        self.back = back
        super.init()
    }
    
}
