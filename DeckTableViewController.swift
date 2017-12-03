//
//  DeckTableViewController.swift
//  StudyBoss
//
//  Created by Brandon Wong on 11/2/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit
import UserNotifications

class DeckTableViewController:
    UITableViewController {
    //Mark: Properties
    var decks = [Deck]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        // Load the sample data.
        loadSampleDecks()
    }
    //Mark: Private Methods

    private func loadSampleDecks(){
        guard let deck1 = Deck(name: "Test1") else{
            fatalError("Unable to instantiate deck1")
        }
        guard let deck2 = Deck(name: "Test2") else{
            fatalError("Unable to instantiate deck2")
        }
        guard let deck3 = Deck(name: "Test3") else{
            fatalError("Unable to instantiate deck3")
        }
        
        decks += [deck1, deck2, deck3]
    }
    
    @IBAction func unwindToDeckList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? FirstViewController, let deck = sourceViewController.deck {
            let newIndexPath = IndexPath(row: decks.count, section: 0)
            decks.append(deck)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
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
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
