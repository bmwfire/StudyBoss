//
//  DeckTableViewCell.swift
//  StudyBoss
//
//  Created by Brandon Wong on 10/26/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit

class DeckTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
