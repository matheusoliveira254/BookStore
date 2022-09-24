//
//  BookListTableViewController.swift
//  BookStore
//
//  Created by Matheus Oliveira on 9/22/22.
//

import UIKit

class BookListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return BookController.sharedInstance.book.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookListTableViewCell else {return UITableViewCell()}

        let books = BookController.sharedInstance.book[indexPath.row]
        
        cell.updateViews(with: books)
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let book = BookController.sharedInstance.book[indexPath.row]
            BookController.sharedInstance.delete(bookToDelete: book)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? BookDetailViewController {
                    let bookToSend = BookController.sharedInstance.book[index.row]
                    destination.bookToReceive = bookToSend
                }
            }
        }
    }
}
