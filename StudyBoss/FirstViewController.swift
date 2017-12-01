//
//  FirstViewController.swift
//  StudyBoss
//
//  Created by Brandon Wong on 9/26/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
///

import UIKit
import os.log

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //MARK: Properties
    
    //@IBOutlet weak var Front: UITextView!
    //@IBOutlet weak var Back: UITextView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var deckNameLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var deck: Deck?
    var cards = [Card]()
    let backs: [String] = ["Back of the Card2"]
    let front: [String] = ["Front of the Card2"]
    let cellReuseIdentifier = "cell"
    @IBOutlet weak var tableView: CardTableView!
    
    //MARK: Private Methods
    private func loadSampleCards(){
        guard let card1 = Card(front: "Front of the Card", back: "Back of the Card") else{
            fatalError("Unable to instantiate card1")
        }
        
        cards += [card1]
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        deckNameLabel.text = nameTextField.text
    }
    //MARK: Actions
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            let name = nameTextField.text ?? ""
            deck = Deck(name: name);
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        
        deck = Deck(name: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //nameTextField.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

       
        
        tableView.delegate = self
        tableView.dataSource = self as! UITableViewDataSource
        loadSampleCards();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
   /* override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cards.count
    }
    
    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CardTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CardTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CardTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let card = cards[indexPath.row]
        
        cell.Front.text = card.front
        cell.Back.text = card.back
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
    }

}

