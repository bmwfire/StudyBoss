//
//  DeckTableViewController.swift
//  StudyBoss
//
//  Created by Brandon Wong on 11/2/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit
import UserNotifications
import os.log

class DeckTableViewController:
    UITableViewController {
    //Mark: Properties
    var decks = [Deck]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        if let savedDecks = loadDecks() {
            decks += savedDecks
        }else{
            loadSampleDecks()
        }
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        loadSampleDecks()
        // Load the sample data.
    }
    //Mark: Private Methods

    private func loadSampleDecks(){
        let front1 = "front"
        let back1 = "back"
        guard let card1 = Card(front: front1, back: back1)else {
            fatalError("Unable to instantiate samplecard1")
        }
        let cards1 = [card1]
 
        let fronts1 = [front1]
        let backs1 = [back1]
        
        guard let deck0 = Deck(name: "test0", cards: cards1, cardfronts: fronts1, cardbacks: backs1)else{
            fatalError("Unable to instantiate deck0")
        }
        /*
        guard let deck1 = Deck(name: "Test1") else{
            fatalError("Unable to instantiate deck1")s
        }
        guard let deck2 = Deck(name: "Test2") else{
            fatalError("Unable to instantiate deck2")
        }
        guard let deck3 = Deck(name: "Test3") else{
            fatalError("Unable to instantiate deck3")
        }
 
        decks += [deck1, deck2, deck3]*/
        decks += [deck0]
    }
    
    private func saveDecks() {
        
        /* TODO FIX THIS
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(decks, toFile: Deck.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Decks successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save decks...", log: OSLog.default, type: .error)
        }
 */
    }
    
    @IBAction func unwindToDeckList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? FirstViewController, let deck = sourceViewController.deck {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing deck.
                decks[selectedIndexPath.row] = deck
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                
                let newIndexPath = IndexPath(row: decks.count, section: 0)
                decks.append(deck)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveDecks()
        }
    }
 
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return decks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "DeckTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DeckTableViewCell  else {
            fatalError("The dequeued cell is not an instance of DeckTableViewCell.")
        }
        
        // Fetches the appropriate deck for the data source layout.
        let deck = decks[indexPath.row]
        
        cell.nameLabel.text = deck.name
        
        return cell
    }
    
    private func loadDecks() -> [Deck]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Deck.ArchiveURL.path) as? [Deck]
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            decks.remove(at: indexPath.row)
            saveDecks()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "AddItem":
            os_log("Adding a new deck.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let deckDetailViewController = segue.destination as? FirstViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedDeckCell = sender as? DeckTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? DeckTableViewCell.self)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedDeckCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedDeck = decks[indexPath.row]
            deckDetailViewController.deck = selectedDeck
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
 

}
