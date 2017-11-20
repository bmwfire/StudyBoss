//
//  CardTableViewCell.swift
//  StudyBoss
//
//  Created by Andrew Millard on 11/19/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var Front: UITextView!
    @IBOutlet weak var Back: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
