//
//  SecondTableViewCell.swift
//  SilverConnect
//
//  Created by suhseungju on 2023/07/01.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var state_custom: UILabel!
    @IBOutlet weak var title_custom: UILabel!
    @IBOutlet weak var age_custom: UILabel!
    @IBOutlet weak var date_custom: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
