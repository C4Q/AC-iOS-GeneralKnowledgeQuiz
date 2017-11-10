//
//  TableViewCell.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


    
}
