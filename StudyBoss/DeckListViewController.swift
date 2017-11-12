//
//  DeckListViewController.swift
//  StudyBoss
//
//  Created by Brandon Wong on 11/2/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit

class DeckListViewController: UIViewController {
    @IBAction func unwindToDeckList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? FirstViewController, let deck = sourceViewController.deck {
            let newIndexPath = IndexPath(row: decks.count, section: 0)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

