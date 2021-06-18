//
//  HomeViewController.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 08/06/2021.
//

import UIKit
import Firebase
import FirebaseStorage

class HomeViewController: UIViewController {
    
    var receiverEmail : String?
    var theSelectedUserProfilPicture: UIImage?
    var usernameOfUserToMessage : String?
    var images : [UserPicture]? = []
    var userManager:UserManager?
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.toolbar.isHidden = false
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "My friends list"
        navigationItem.hidesBackButton = true
        usersTableView.layer.cornerRadius = 10
        usersTableView.layer.borderWidth = 1
        usersTableView.dataSource = self
        usersTableView.delegate = self
        usersTableView.register(UINib(nibName: "UsersCell", bundle: nil), forCellReuseIdentifier: "ReIdentifier")
        userManager = UserManager(userList: [], delegate: self)
        userManager!.loadUsers()
        userManager?.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.toolbar.isHidden = false
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func LogOutTapped(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            
        }
        
    }
    
}



extension HomeViewController : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userManager?.userList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReIdentifier", for: indexPath) as! UsersCell
        cell.usernameLabel.text = userManager?.userList![indexPath.row].username
        if images?.count == userManager?.userList?.count {
            
            for i in images! {
                if i.id == userManager?.userList![indexPath.row].email {
                    cell.userProfilPicture.image = i.image
                    break
                }
                
            }

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let m = tableView.cellForRow(at: indexPath) as? UsersCell
        usernameOfUserToMessage = (m?.usernameLabel.text)!
        theSelectedUserProfilPicture = m?.userProfilPicture.image!
        receiverEmail = userManager?.userList![indexPath.row].email
        
        performSegue(withIdentifier: "SendMessage", sender: self)
        tableView.cellForRow(at: indexPath)?.isSelected = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendMessage" {
            if let ConvViewController = segue.destination as? ConversationViewController {
                let backItem = UIBarButtonItem()
                backItem.title = "Back"
                navigationItem.backBarButtonItem = backItem
                ConvViewController.title = usernameOfUserToMessage
                ConvViewController.receiverProfilPicture = theSelectedUserProfilPicture
                ConvViewController.receiverEmail = receiverEmail
                
            }
            
        }
        
    }
    
}



extension HomeViewController : UsersDelegate {
    
    func getProfilPicture(img: UIImage , email : String) {
        images?.append(UserPicture(image: img , id: email))
        if images?.count == userManager?.userList?.count{
            DispatchQueue.main.async {
                self.usersTableView.reloadData()
                
            }
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
        }
        
    }
    
    
    func updateUserslist(user: User) {
        userManager?.userList?.append(user)
        
    }
    
    
    
}
