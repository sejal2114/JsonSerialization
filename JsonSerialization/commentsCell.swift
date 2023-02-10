//
//  commentsCell.swift
//  JsonSerialization
//
//  Created by Sejal on 09/02/23.
//

import UIKit

class commentsCell: UITableViewCell {
    
    @IBOutlet weak var IdLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var EmailLabel: UILabel!
    
    @IBOutlet weak var BodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
