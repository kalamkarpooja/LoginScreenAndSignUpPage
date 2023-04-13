//
//  LoginTableViewController.swift
//  Login Screen
//
//  Created by Mac on 28/02/23.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginBtn(_ sender: UIButton) {
        validationCode()
            
    }
    @IBAction func signUpBtn(_ sender: UIButton) {
       let signUpVC =  self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        navigationController?.pushViewController(signUpVC!, animated: true)
        }
    }
extension LoginTableViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableviewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        let centeringInset = (tableviewHeight - contentHeight) / 2.0
        let topInset = max(centeringInset,0.0)
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
}
extension LoginTableViewController{
    fileprivate func validationCode() {
        if let email = emailTextField.text , let password = passwordTextField.text{
            if email.validEmailId(){
                openAlert(title: "Alert", message: "Email not found", alertStyle: .alert, actionTitles: ["okay"], actionStyle: [.default], actions: [{_ in
                    print("okay clicked")
                }])
            }else if password.validatePassword(){
                openAlert(title: "Alert", message: "enter valid password", alertStyle: .alert, actionTitles: ["okay"], actionStyle: [.default], actions: [{_ in
                    print("okay clicked")
                }])
            }else{
                //navigation - home screen
                
            }
        }else{
            openAlert(title: "Alert", message: "please add detail", alertStyle: .alert, actionTitles: ["okay"], actionStyle: [.default], actions: [{_ in
                print("okay clicked")
            }])
        }
    }
}
