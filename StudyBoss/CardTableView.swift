//
//  CardTableView.swift
//  StudyBoss
//
//  Created by Andrew Millard on 11/25/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit

class CardTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var cards = [Card]()
    
    //MARK: Private Methods
    private func loadSampleCards(){
        guard let card1 = Card(front: "Front of the Card", back: "Back of the Card") else{
            fatalError("Unable to instantiate card1")
        }
        
        cards += [card1]
    }

}
