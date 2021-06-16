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
    
    var theSelectedUserProfilPicture: UIImage?
    var usernameOfUserToMessage : String?
    var images : [UIImage]? = []
    var userManager:UserManager?
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userManager = UserManager(userList: [], delegate: self)
        navigationItem.title = "My friends list"
        //        navigationItem.titleView?.tintColor = UIColor(named: )
        navigationItem.hidesBackButton = true
        usersTableView.dataSource = self
        userManager!.loadUsers()
        usersTableView.register(UINib(nibName: "UsersCell", bundle: nil), forCellReuseIdentifier: "ReIdentifier")
        userManager?.delegate = self
        usersTableView.delegate = self
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
            cell.userProfilPicture.image = images![indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let m = tableView.cellForRow(at: indexPath) as? UsersCell
        print("\n\nUSERNAME OF THE SELECTED IS : ",(m?.usernameLabel.text)!,"\n\n")
        usernameOfUserToMessage = (m?.usernameLabel.text)!
        theSelectedUserProfilPicture = m?.userProfilPicture.image!
        performSegue(withIdentifier: "SendMessage", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendMessage" {
            if let ConvViewController = segue.destination as? ConversationViewController {
                let backItem = UIBarButtonItem()
                backItem.title = "Back"
                navigationItem.backBarButtonItem = backItem
                ConvViewController.title = usernameOfUserToMessage
                ConvViewController.receiverProfilPicture = theSelectedUserProfilPicture
                
            }
            
        }
        
    }
    
}


extension HomeViewController : UsersDelegate {
    
    func getProfilPicture(img: UIImage?) {
        images?.append(img!)
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
