//
//  FirstViewController.swift
//  StudyBoss
//
//  Created by Brandon Wong on 9/26/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
///

import UIKit
import os.log

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    
    //@IBOutlet weak var Front: UITextView!
    //@IBOutlet weak var Back: UITextView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var deckNameLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var CardTableView: UITableView!
    @IBOutlet weak var AddButton: UIButton!
    
    var deck: Deck?
    var cards = [Card]()
    var backs: [String] = ["Back of the Card2"]
    var fronts: [String] = ["Front of the Card2"]
    let cellReuseIdentifier = "cell"
    @IBOutlet weak var tableView: CardTableView!
    
    
    
    //MARK: Private Methods
    private func loadSampleCards(){
        guard let card1 = Card(front: "Front of the Card2", back: "Back of the Card") else{
            fatalError("Unable to instantiate card1")
        }
        
        cards += [card1]
    }
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        deckNameLabel.text = nameTextField.text
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    //MARK: Actions
    
    @IBAction func addData2(_ sender: Any) {
        guard let newCard1 = Card(front: "3", back: "2") else{
            fatalError("Unable to instantiate newCard1")
        }
        cards += [newCard1]
        tableView.reloadData()
    }

    /*
    @IBAction func addData(sender: AnyObject){
        AddButton = sender as! UIButton
        guard let newCard2 = Card(front: "Front of the Card1", back: "Back of the Card") else{
            fatalError("Unable to instantiate newCard2")
        }
        cards += [newCard2]
        tableView.reloadData()
        /*
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: cards.count-1, section: 0)], with: . automatic)
        tableView.endUpdates()
        */
    }
 
    
    func action(sender: UIButton!){
        guard let newCard3 = Card(front: "Front of the Card2", back: "Back of the Card") else{
        fatalError("Unable to instantiate newCard3")
        }
        cards += [newCard3]
        tableView.reloadData()
    }
 */
    //MARK: Navigation
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let cards = self.cards
        let cardfronts = fronts
        let cardbacks = backs
        
        deck = Deck(name: name, cards: cards, cardfronts: fronts, cardbacks: backs)
        //TODO above line may be incorrect
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //nameTextField.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        nameTextField.delegate = self as? UITextFieldDelegate
        tableView.delegate = self
        tableView.dataSource = self as UITableViewDataSource
        //IF EDITING EXISTING DECK THEN DO FOLLOWING
        if let deck = deck {
            navigationItem.title = deck.name
            backs = deck.cardbacks
            fronts = deck.cardfronts
            cards = deck.cards
        }
        
        updateSaveButtonState()
        loadSampleCards();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    /*
    - (void)viewDidAppear:(BOOL)animated
    {
        [self.tableView setFrame:CGRectMake(x,y,width,height)];
    }
    */
    func numberOfSections(in tableView: UITableView) -> Int {
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
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CardTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CardTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let card = cards[indexPath.row]
        
        cell.Front.text = card.front
        cell.Back.text = card.back
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat{
         return 180
    }
   

}

