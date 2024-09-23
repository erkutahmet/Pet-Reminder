//
//  SohbetTableViewCell.swift
//  Pet Reminder
//
//  Created by erkut on 23.09.2024.
//

import UIKit

class SohbetTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTextLbl: UILabel!
    @IBOutlet weak var vetImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
