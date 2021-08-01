//
//  HomeViewController.swift
//  AcropolisTest
//
//  Created by Apple on 31/07/21.
//

import UIKit
import Firebase

class HomeViewController: UITabBarController {
    
    let btn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        
        
        do {
            try Auth.auth().signOut()
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

}
