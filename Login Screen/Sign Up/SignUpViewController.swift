//
//  SignUpViewController.swift
//  Login Screen
//
//  Created by Mac on 21/03/23.
//

import UIKit
class SignUpViewController: UITableViewController {
 
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var cPasswordTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgProfile.isUserInteractionEnabled = true
        imgProfile.addGestureRecognizer(tapGesture)
    }
    @objc
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        print("Image Tapped")
    }
    
    
    
    @IBAction func loginBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
            
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableviewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        let centeringInset = (tableviewHeight - contentHeight) / 2.0
        let topInset = max(centeringInset,0.0)
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }

    @IBAction func signUp(_ sender: UIButton) {
        let imgSystem = UIImage(systemName: "person.crop.circle.badge.plus.fill")
        if imgProfile.image?.pngData() == imgSystem?.pngData(){
            let email = emailTxt.text
            let password = passwordTxt.text
            let username = usernameTxt.text
            let cPassword = cPasswordTxt.text
            if email!.validEmailId(){
                openAlert(title: "Alert", message: "please enter valis email", alertStyle: .alert, actionTitles: ["okay"], actionStyle: [.default], actions: [{_ in
                    
                }])
                    print("email is not valid")
            }else if password!.validatePassword(){
                    print("password is not valid")
            }else if username == ""{
                print("please enter username")
            }
                else{
                if cPassword == ""{
                    print("please confirm password")
                }else{
                    if password == cPassword{
                        
                    }else{
                        print("password does not match")
                    }
                }
            }
            
        }else{
            print("please click your details..")
        }
    }
}
extension SignUpViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .savedPhotosAlbum
            present(picker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         let img = info[.originalImage] as? UIImage
    }
    
}
