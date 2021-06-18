//
//  ConversationViewController.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 10/06/2021.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ConversationViewController: UIViewController {
    
    var receiverEmail:String?
    var receiverProfilPicture : UIImage?
    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var messageToSendTextField: UITextField!
    var messages : [Message]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTableView.dataSource = self
        messagesTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageToSendCell")
        messagesTableView.register(UINib(nibName: "AnswerMessageCell", bundle: nil), forCellReuseIdentifier: "answerCell")
        messageToSendTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        loadMessages()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.toolbar.isHidden = true
        navigationController?.navigationBar.isHidden = false
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func loadMessages(){
        let db = Firestore.firestore()
        if let currentEmail = Auth.auth().currentUser?.email , let receiverEmail = receiverEmail{
            let link = String((currentEmail+receiverEmail).sorted())
            db.collection("Messages/usersConversation/\(link)").order(by: "date").addSnapshotListener { (qSnapshot, err) in
                self.messages = []
                if err != nil {
                    print(err!.localizedDescription)
                    return
                }else{
                    if let documents = qSnapshot?.documents {
                        for doc in documents {
                            let data = doc.data()
                            if let sender = data["sender"] as? String, let receiver = data["receiver"] as? String, let body = data["Body"] as? String {
                                self.messages?.append(Message(sender: sender, receiver: receiver, body: body))
                                DispatchQueue.main.async {
                                    self.messagesTableView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func SendButtonTapped(_ sender: UIButton) {
        messageToSendTextField.endEditing(true)
        let date = Date()
        let db = Firestore.firestore()
        if let receiverEmail = receiverEmail , let currentEmail = Auth.auth().currentUser?.email {
            let dateSince1970String = String(date.timeIntervalSince1970)
            let link = String((currentEmail+receiverEmail).sorted())
            db.collection("Messages/usersConversation/\(link)").addDocument(data:["Body":messageToSendTextField.text!,"sender":currentEmail,"receiver":receiverEmail , "date":dateSince1970String]) { (err) in
                if err != nil {
                    print("\n The error on adding the message data is : ",err!.localizedDescription)
                    return
                }
            }
        }
        messageToSendTextField.text = ""
    }
    
    
}



extension ConversationViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  messages?[indexPath.row].sender == Auth.auth().currentUser?.email {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MessageToSendCell", for: indexPath) as? MessageCell
            cell?.messageLabel.text = messages?[indexPath.row].body
            
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as? AnswerMessageCell
            cell?.messageLabel.text = messages?[indexPath.row].body
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



