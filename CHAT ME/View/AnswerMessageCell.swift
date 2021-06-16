//
//  AnswerMessageCell.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 11/06/2021.
//

import UIKit

class AnswerMessageCell: UITableViewCell {

    @IBOutlet weak var answerMessageContainer: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var receiverProfilPicture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        receiverProfilPicture.layer.cornerRadius = receiverProfilPicture.frame.width/2
        receiverProfilPicture.layer.borderWidth = 0.5
        answerMessageContainer.layer.cornerRadius = 10
        answerMessageContainer.layer.borderWidth = 1

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
