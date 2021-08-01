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
        let first = App()
        first.name = "First App"
        let second  = App()
        second.name = "Seond App"
        appList.append(first)
        appList.append(second)

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = appList[indexPath.row].name
        return cell
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
