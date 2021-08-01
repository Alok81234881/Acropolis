//
//  AppsViewController.swift
//  AcropolisTest
//
//  Created by Apple on 31/07/21.
//

import UIKit

class AppsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var appList : [App] = [App]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showDemoData()
        self.tabBarController?.navigationItem.title = "Apps"

        // Do any additional setup after loading the view.
    }
    func showDemoData() {
        let first = App()
        first.name = "Raxa"
        let second  = App()
        second.name = "Netflix"
        let second2  = App()
        second2.name = "Amazon Prime Video"
        let second3  = App()
        second3.name = "Facebook"
        let second4  = App()
        second4.name = "Twitter"
        let second5  = App()
        second5.name = "Zomatto"
        appList.append(first)
        appList.append(second)
        appList.append(second2)
        appList.append(second3)
        appList.append(second4)
        appList.append(second5)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Apps"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = appList[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Edit item", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "Update", style: .default) { (alertAction) in
          let textField = alert.textFields![0] as UITextField
            self.appList[indexPath.row].name = textField.text! as String
            self.tableView.reloadData()
        }
        alert.addTextField { [unowned self](textField) in
            textField.text = self.appList[indexPath.row].name
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
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
