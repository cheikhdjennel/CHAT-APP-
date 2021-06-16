//
//  CompleteRegisterViewController.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 06/06/2021.
//

import UIKit
import FirebaseStorage
import FirebaseAuth

class CompleteRegisterViewController: UIViewController {
    
    @IBOutlet weak var ProfilPictureImageView: UIImageView!
    @IBOutlet weak var BioTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfilPictureImageView.layer.borderWidth = 0.5
        ProfilPictureImageView.layer.cornerRadius = (ProfilPictureImageView.bounds.width+ProfilPictureImageView.bounds.height)/4
        //        ProfilPictureImageView.layer.borderColor = UIColor.white.cgColor
        ProfilPictureImageView.layer.borderColor = UIColor(red: 242/255, green: 80/255, blue: 0/255, alpha: 1).cgColor
        ProfilPictureImageView.isUserInteractionEnabled = true
        ProfilPictureImageView.layer.masksToBounds = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilPic))
        ProfilPictureImageView.addGestureRecognizer(gesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.toolbar.isHidden = true
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        
    }
    
    @IBAction func CompleteRegisterTapped(_ sender: UIButton) {
        uploadProfilPictureInFirebaseStorage()
        performSegue(withIdentifier: "FinishedTheRegistration", sender: self)
        
    }
    
    func uploadProfilPictureInFirebaseStorage(){
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imagesRef = storageRef.child("Pictures/\(Auth.auth().currentUser!.email!).png")
        if let uploadData = ProfilPictureImageView.image?.pngData(){
            imagesRef.putData(uploadData, metadata: nil) { (metadata, err) in
                if err != nil {
                    print(err!.localizedDescription)
                    
                    return
                }
                
            }
            
        }
    }
    
    @objc func didTapChangeProfilPic() {
        presentPhotoActionSheet()
        
    }
    
}


extension CompleteRegisterViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    func presentPhotoActionSheet ()  {
        let action = UIAlertController(title: "Profil Picture", message: "Select a picture from library or take a picture ", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: " Cancel", style: .cancel, handler: nil))
        action.addAction(UIAlertAction(title: " Take a Photo ", style: .default, handler: { [weak self ]_ in
            self?.presentCamera()
            
        }))
        action.addAction(UIAlertAction(title: " Select a Photo from library", style: .default, handler: {  [weak self ]_ in
            self?.presentPhotoPicker()
            
        }))
        present(action, animated: true, completion: nil)
        
    }
    
    func presentCamera()  {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func presentPhotoPicker()  {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        ProfilPictureImageView.image = selectedImage
        
    }
    
}
