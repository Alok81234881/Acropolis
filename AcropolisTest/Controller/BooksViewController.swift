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
        let first = Book()
        first.name = "First Book"
        let second = Book()
        second.name = "Second Book"
        
        bookList.append(first)
        bookList.append(second)

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = bookList[indexPath.row].name
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
