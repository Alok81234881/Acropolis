//
//  EntertainmentViewController.swift
//  AcropolisTest
//
//  Created by Apple on 31/07/21.
//

import UIKit

class EntertainmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var entertainmentList : [Entertainment] = [Entertainment]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.showDemoData()
        //self.navigationController?.navigationBar.topItem?.title = "top title"
        self.tabBarController?.navigationItem.title = "Entertainment"
        // Do any additional setup after loading the view.
    }
    func showDemoData() {
        let first = Entertainment()
        first.name = "Iron Man"
        let second = Entertainment()
        second.name = "3 Idiot"
        let second2 = Entertainment()
        second2.name = "The Blacklist"
        let second3 = Entertainment()
        second3.name = "Inception"
        let second4 = Entertainment()
        second4.name = "Batman"
        let second5 = Entertainment()
        second5.name = "The Arrow"
        
        entertainmentList.append(first)
        entertainmentList.append(second)
        entertainmentList.append(second2)
        entertainmentList.append(second3)
        entertainmentList.append(second4)
        entertainmentList.append(second5)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Entertainment"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entertainmentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = entertainmentList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Edit item", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "Update", style: .default) { (alertAction) in
          let textField = alert.textFields![0] as UITextField
            
            self.entertainmentList[indexPath.row].name = textField.text! as String
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alert.addTextField { [unowned self](textField) in
            textField.text = self.entertainmentList[indexPath.row].name
            
        }
        alert.addAction(action)
        alert.addAction(cancelAction)
//        self.view.present(EntertainmentViewController, animated:true, completion: nil)
        self.present(alert, animated: true, completion: nil)
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
