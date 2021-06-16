//
//  UsersCell.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 11/06/2021.
//

import UIKit

class UsersCell: UITableViewCell {

    @IBOutlet weak var userProfilPicture: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userProfilPicture.layer.cornerRadius = userProfilPicture.frame.width/2
        userProfilPicture.layer.borderWidth = 0.5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
