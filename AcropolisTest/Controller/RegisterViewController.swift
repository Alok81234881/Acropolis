//
//  RegisterViewController.swift
//  AcropolisTest
//
//  Created by Apple on 31/07/21.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        print(emailTextField.text!)
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil{
                print(error!)
            }else{
                //Success
                print("Registration Successfull")
                
                SVProgressHUD.dismiss()
                
               // self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
