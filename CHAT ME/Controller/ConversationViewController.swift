//
//  ConversationViewController.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 10/06/2021.
//

import UIKit

class ConversationViewController: UIViewController {
    
    var receiverProfilPicture : UIImage?
    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var messageToSendTextField: UITextField!
    var messages : [Message] = [Message(sender: "person5", receiver: "person10", body: "HELLOOOO   You stil  a w a k e  man "),Message(sender: "person10", receiver: "person5", body: "Hey , yes iam , coudln't sleep , so how are u doing ? "),
                                Message(sender: "person5", receiver: "person10", body: " Well me too , couldn't sleep , Im fine wht abt you ? "),Message(sender: "person10", receiver: "person05", body: "Im doing good HamdouliAllah  ")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTableView.dataSource = self
        messagesTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageToSendCell")
        messagesTableView.register(UINib(nibName: "AnswerMessageCell", bundle: nil), forCellReuseIdentifier: "answerCell")
        messageToSendTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.toolbar.isHidden = true
        navigationController?.navigationBar.isHidden = false
        
    }
    
    @IBAction func SendButtonTapped(_ sender: UIButton) {
        messageToSendTextField.endEditing(true)
        messages.append(Message(sender: "person5", receiver: "person10", body: messageToSendTextField.text))
        DispatchQueue.main.async {
            self.messagesTableView.reloadData()
        }
        messageToSendTextField.text = ""
    }
    
}



extension ConversationViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messages[indexPath.row].sender == "person5"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MessageToSendCell", for: indexPath) as? MessageCell
            cell?.messageLabel.text = messages[indexPath.row].body
            
            return cell!
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as? AnswerMessageCell
            cell?.messageLabel.text = messages[indexPath.row].body
            cell?.receiverProfilPicture.image = receiverProfilPicture
            
            return cell!
        }
    }
    
}
extension ConversationViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != nil {
            return true
        }else{
            return false
        }
    }
    
    
}
