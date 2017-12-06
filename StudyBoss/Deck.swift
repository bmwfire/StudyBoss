//
//  Deck.swift
//  StudyBoss
//
//  Created by Brandon Wong on 11/2/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit
import os.log
import Foundation
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
        self.cards = cards
        self.cardfronts = cardfronts
        self.cardbacks = cardbacks
        super.init()
    }
    //Mark: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let cardsKey = "cards"
        static let cardfrontsKey = "cardfronts"
        static let cardbacksKey = "cardbacks"
    }
    //Mark: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        //aCoder.encode(cards, forKey: PropertyKey.cardsKey)
        aCoder.encode(cards, forKey: PropertyKey.cardsKey)// as! [Card]
        aCoder.encode(cardfronts, forKey: PropertyKey.cardfrontsKey)
        aCoder.encode(cardbacks, forKey: PropertyKey.cardbacksKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let cards = aDecoder.decodeObject(forKey: PropertyKey.cardsKey) as? [Card]
        
        let cardfronts = aDecoder.decodeObject(forKey: PropertyKey.cardfrontsKey) as? [String]
        
        let cardbacks = aDecoder.decodeObject(forKey: PropertyKey.cardbacksKey) as? [String]
 
        self.init(name: name, cards: cards!, cardfronts: cardfronts!, cardbacks: cardbacks!)
    }
    
}


