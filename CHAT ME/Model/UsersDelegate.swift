//
//  UsersDelegate.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 14/06/2021.
//

import Foundation
import UIKit

protocol UsersDelegate {
    
    func updateUserslist(user : User)
    func reloadTableView()
    func getProfilPicture(img : UIImage , email:String)

}
