//
//  UserManager.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 12/06/2021.
//

import Foundation
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

struct UserManager {
    
    var userList : [User]?
    var delegate : UsersDelegate?
    
    func loadUsers()  {
        let db = Firestore.firestore()
        db.collection("users").getDocuments { (querySnapshot, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }else {
                
                if let documents = querySnapshot?.documents {
                    for doc in documents {
                        let data = doc.data()
                        if let email = data["email"] as? String ,let username = data["username"] as? String , let uid = data["uid"] as? String {
                            
                            
                            
                            let us = User(username: username, email: email, uid: uid)
                            if us.email != Auth.auth().currentUser?.email! {
                                self.delegate?.updateUserslist(user: us)
                                self.getUsersProfilPictureFromFirestoreStorage(us.email!)
                                
                                
                                
                            }
                        }
                        
                    }
                    DispatchQueue.main.async {
                        self.delegate?.reloadTableView()
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    
    func getUsersProfilPictureFromFirestoreStorage(_ email : String)  {
        var image : UIImage?
        let storage = Storage.storage()
        let storageRef = storage.reference(withPath:"Pictures")
        let imagesRef = storageRef.child("\(email).png")
        imagesRef.getData(maxSize: 1 * 5024 * 5024) { (data, err) in
            if err != nil {
                print("\n\n",err!.localizedDescription )
                
            }
            if let safeData = data {
                image = UIImage(data: safeData)
                self.delegate?.getProfilPicture(img: image! , email: email)
                
            }else{
                image = UIImage(systemName: "person.circle.fill")
                self.delegate?.getProfilPicture(img: image! , email: email)
                
            }
            
            
        }
    }
    
}
