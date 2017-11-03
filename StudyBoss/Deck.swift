//
//  Deck.swift
//  StudyBoss
//
//  Created by Brandon Wong on 11/2/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit

class Deck{
    //Mark: Properties
    var name: String
    
    //MARK: Initialization
    init?(name: String) {
        if name.isEmpty{
            return nil
        }
        self.name = name
    }

}


