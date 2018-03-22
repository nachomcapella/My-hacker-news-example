//
//  HackerNewsTableViewCell.swift
//  
//
//  Created by Mariano Martinez on 22/3/18.
//

import UIKit

class HackerNewsTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var authorLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
