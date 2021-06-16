//
//  MessageCell.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 11/06/2021.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageContainerView.layer.cornerRadius = 10
        messageContainerView.layer.borderWidth = 1

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
