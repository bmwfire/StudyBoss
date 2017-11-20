//
//  FirstViewController.swift
//  StudyBoss
//
//  Created by Brandon Wong on 9/26/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit
import os.log

class FirstViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    
    //@IBOutlet weak var Front: UITextView!
    //@IBOutlet weak var Back: UITextView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var deckNameLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var deck: Deck?
    var cards = [Card]()
    
    //MARK: Private Methods
    private func loadSampleCards(){
        guard let card1 = Card(front: "Front of the Card", back: "Back of the Card") else{
            fatalError("Unable to instantiate deck1")
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
        nameTextField.delegate = self
        loadSampleCards();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

