//
//  BooksViewController.swift
//  AcropolisTest
//
//  Created by Apple on 31/07/21.
//

import UIKit

class BooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var bookList : [Book] = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Books"
        self.showDemoData()
        
        self.tabBarController?.navigationItem.title = "Books"

        // Do any additional setup after loading the view.
    }
    func showDemoData() {
        let first = Book()
        first.name = "Core Java"
        let second = Book()
        second.name = "Introdution to swift"
        let second2 = Book()
        second2.name = "History"
        let second3 = Book()
        second3.name = "Core Data for professional"
        let second4 = Book()
        second4.name = "Political Science"
        
        bookList.append(first)
        bookList.append(second)
        bookList.append(second2)
        bookList.append(second3)
        bookList.append(second4)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Books"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = bookList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Edit item", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "Update", style: .default) { (alertAction) in
          let textField = alert.textFields![0] as UITextField
            
            self.bookList[indexPath.row].name = textField.text! as String
            self.tableView.reloadData()
        }
        alert.addTextField { (textField) in
            textField.text = self.bookList[indexPath.row].name
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
