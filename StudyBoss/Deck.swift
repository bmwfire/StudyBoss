//
//  Deck.swift
//  StudyBoss
//
//  Created by Brandon Wong on 11/2/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit
import os.log

class Deck: NSObject, NSCoding{
    
    
    
    //Mark: Properties
    var name: String
    var cards = [Card]()
    var cardfronts = [String]()
    var cardbacks = [String]()
    
    //Mark: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("decks")
    
    //MARK: Initialization
    init?(name: String, cards: [Card], cardfronts: [String], cardbacks: [String]) {
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
    //Mark: Types
    struct PropertyKey {
        static let name = "name"
        static let cards = "cards"
        static let cardfronts = "cardfronts"
        static let cardbacks = "cardbacks"
    }
    //Mark: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(cards, forKey: PropertyKey.cards)
        aCoder.encode(cardfronts, forKey: PropertyKey.cardfronts)
        aCoder.encode(cardbacks, forKey: PropertyKey.cardbacks)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let cards = aDecoder.decodeObject(forKey: PropertyKey.cards) as? [Card]
        
        let cardfronts = aDecoder.decodeObject(forKey: PropertyKey.cardfronts) as? [String]
        
        let cardbacks = aDecoder.decodeObject(forKey: PropertyKey.cardbacks) as? [String]
        
        self.init(name: name, cards: cards!, cardfronts: cardfronts!, cardbacks: cardbacks!)
    }
    
}


