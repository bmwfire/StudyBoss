//
//  FirstViewController.swift
//  StudyBoss
//
//  Created by Brandon Wong on 9/26/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
///

import UIKit
import os.log

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UITextFieldDelegate, UITableViewDataSourcePrefetching {
    
    //MARK: Properties
    
    //@IBOutlet weak var Front: UITextView!
    //@IBOutlet weak var Back: UITextView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var deckNameLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var backTextField: UITextField!
    @IBOutlet weak var frontTextField: UITextField!
    weak open var prefetchDataSource: UITableViewDataSourcePrefetching?
    //[self.customCollectionView setPrefetchingEnabled:NO]
    var cells = [CardTableViewCell]()
    var deck: Deck?
    var cards = [Card]()
    var backs = [String]()// = ["Back of the Card2"]
    var fronts = [String]()// = ["Front of the Card2"]
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var tableView: CardTableView!
    
    
    //MARK: Private Methods
    private func loadSampleCards(){
        let frontSample = "Front loadSampleCards"
        let backSample = "Back loadSampleCards"
        guard let card1 = Card(front: frontSample, back: backSample) else{
            fatalError("Unable to instantiate card1")
        }
        guard let card2 = Card(front: frontSample, back: backSample) else{
            fatalError("Unable to instantiate card2")
        }
        guard let card3 = Card(front: frontSample, back: backSample) else{
            fatalError("Unable to instantiate card3")
        }
        guard let card4 = Card(front: frontSample, back: backSample) else{
            fatalError("Unable to instantiate card3")
        }
        
        fronts += [frontSample, frontSample, frontSample, frontSample]
        backs += [backSample, backSample, backSample, backSample]
        cards += [card1, card2, card3, card4]
    }
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        //cards = tableView.cards
        /*
        fronts = [String]()
        backs = [String]()
        for i in 0 ..< cards.count{
            fronts.append(cards[i].front)
            backs.append(cards[i].back)
        }
        */
        
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
    
    @IBAction func ViewCards(_ sender: UIButton) {
        /*
        let myVC = storyboard?.instantiateViewController(withIdentifier: "flipViewController") as! FlipViewController
        myVC.frontsFlip = fronts
        myVC.backsFlip = backs
        navigationController?.pushViewController(myVC, animated: true)
 */
    }
    @IBAction func addData2(_ sender: Any) {
        /*
        let frontAdd = "Front AddCard"
        let backAdd = "Back AddCard"
        guard let newCard1 = Card(front: frontAdd, back: backAdd) else{
            fatalError("Unable to instantiate newCard1")
        }
        fronts += [frontAdd]
        backs += [backAdd]
        cards += [newCard1]
        tableView.reloadData()
 */
        let frontAdd = frontTextField.text
        let backAdd = backTextField.text
        guard let newCard1 = Card(front: frontAdd!, back: backAdd!) else{
            fatalError("Unable to instantiate newCard1")
        }
        fronts.append(frontAdd!)
        backs.append(backAdd!)
        cards += [newCard1]
        tableView.reloadData()
    }

    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]){
        
    }
    public func tableView(_tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]){
        
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
    /*
    @IBAction func UpdateCards(_ sender: UIButton) {
        updateCardView()
    }
 */
    func updateCardView(){
        /*
         let index = IndexPath(row: 0, section: 0)
         let cell: CardTableViewCell = self.tableView.cellForRow(at: index) as! CardTableViewCell
         self.backs[0] = cell.Back.text
         self.fronts[0] = cell.Front.text
         */
        fronts = [String]()
        backs = [String]()
        
        for i in 0 ..< cards.count{
            fronts.append(cards[i].front)
            backs.append(cards[i].back)
        }
        /*
        //UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:<requiredIndexPath>]
        for i in 0 ..< cards.count{
            let index = IndexPath(row: i, section: 0)
            let cell: CardTableViewCell = self.tableView.cellForRow(at: index) as! CardTableViewCell
            self.backs[i] = cell.Back.text
            self.fronts[i] = cell.Front.text
            cards[i].back = backs[i]
            cards[i].front = fronts[i]
        }
 
        tableView.reloadData()
 */
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddDeckMode = presentingViewController is UINavigationController
        
        if isPresentingInAddDeckMode {
            /*
            if let owningNavigationController1 = navigationController{
                owningNavigationController1.popViewController(animated: true)
            }*/
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            //TODO the dismiss functin may not suppose to be there
            dismiss(animated: true, completion: nil)
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The DeckViewController is not inside a navigation controller.")
        }
    }
    
    /*
    @IBAction func cancel(_ sender: UIBarButtonItem) {
     }
 */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //super.prepare(for: segue, sender: sender)
        if(segue.identifier == "toFlip"){
            if let nav_vc = segue.destination as? UINavigationController{
                if let vc = nav_vc.topViewController as? FlipViewController{
                    let cardfronts = self.fronts
                    let cardbacks = self.backs
                    vc.frontsFlip = cardfronts
                    vc.backsFlip = cardbacks
                }
                
            }
            
            
            
            
        }else{
            // Configure the destination view controller only when the save button is pressed.
            guard let button = sender as? UIBarButtonItem, button === saveButton else {
                os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
                return
            }
            
            let name = nameTextField.text ?? ""
            let cards = self.cards
            let cardfronts = fronts
            let cardbacks = backs
            
            deck = Deck(name: name, cards: cards, cardfronts: cardfronts, cardbacks: cardbacks)
            //TODO above line may be incorrect
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //nameTextField.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.prefetchDataSource = self
        nameTextField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self as UITableViewDataSource
        //IF EDITING EXISTING DECK THEN DO FOLLOWING
        //For setting up an existing deck variables
        if let deck = deck {
            navigationItem.title = deck.name
            nameTextField.text = deck.name
            backs = deck.cardbacks
            fronts = deck.cardfronts
            cards = deck.cards
        }else{
            loadSampleCards();
        }
        
        updateSaveButtonState()
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
        
        // Fetches the appropriate card for the data source layout.
        let card = cards[indexPath.row]
        
        cell.Front.text = card.front
        cell.Back.text = card.back
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    func tableview(_ tableView: UITableView, reloadRowsAt indexPath: IndexPath){
        
    }
    /*
    func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
     
    }
 */
    /*
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?){
     
        for i in 0 ..< cards.count{
            fronts.append(cards[i].front)
            backs.append(cards[i].back)
        }
        for i in 0 ..< cards.count{
            let index = IndexPath(row: i, section: 0)
            let cell: CardTableViewCell = self.tableView.cellForRow(at: index) as! CardTableViewCell
            self.backs[i] = cell.Back.text
            self.fronts[i] = cell.Front.text
            cards[i].back = backs[i]
            cards[i].front = fronts[i]
        }
        let cell: CardTableViewCell = self.tableView.cellForRow(at: indexPath!) as! CardTableViewCell
        let i =
        self.backs[i] = cell.Back.text
        self.fronts[i] = cell.Front.text
        cards[i].back = backs[i]
        cards[i].front = fronts[i]
 
    }*/
    //@IBOutlet weak var test: UITextView!
    func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat{
         return 180
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            cards.remove(at: indexPath.row)
            //saveCards()
            updateCardView()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

}

