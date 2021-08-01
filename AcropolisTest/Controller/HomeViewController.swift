//
//  HomeViewController.swift
//  AcropolisTest
//
//  Created by Apple on 31/07/21.
//

import UIKit
import Firebase
import SVProgressHUD

class HomeViewController: UITabBarController {
    
    let textView = UITextView(frame: CGRect.zero)
    var feedback = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        SVProgressHUD.show()
        
        do {
            try Auth.auth().signOut()
            SVProgressHUD.dismiss()
            navigationController?.popToRootViewController(animated: true)
            
        }
        catch {
            print("Error,There was a problem logging out")
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
    @IBAction func feedbackButtonPressed(_ sender: UIBarButtonItem) {
          
        let alert = UIAlertController(title: "Enter Feednack", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "Sumbit", style: .default) { (alertAction) in
          let textField = alert.textFields![0] as UITextField
            self.feedback = textField.text!
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alert.addTextField { (textField) in
            textField.text = self.feedback
        }
        alert.addAction(action)
        alert.addAction(cancelAction)
//        self.view.present(EntertainmentViewController, animated:true, completion: nil)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
