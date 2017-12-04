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
    let backs: [String] = ["Back of the Card1"]
    let front: [String] = ["Front of the Card1"]
    var cards = [Card]()
    
    let cellReuseIdentifier = "cell"
    
    //MARK: Private Methods
    private func loadSampleCards(){
        guard let card1 = Card(front: "Front of the Card", back: "Back of the Card") else{
            fatalError("Unable to instantiate card1")
        }
        
        cards += [card1]
    }
    
    //MARK: Navigation
    func viewDidLoad() {
        //super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //nameTextField.delegate = self
        loadSampleCards();
        
        //UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cards.count
    }
    
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
    

}
