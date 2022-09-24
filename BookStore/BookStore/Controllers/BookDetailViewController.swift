//
//  BookDetailViewController.swift
//  BookStore
//
//  Created by Matheus Oliveira on 9/22/22.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var bookAuthorTextField: UITextField!
    @IBOutlet weak var bookRatingTextField: UITextField!
    @IBOutlet weak var bookSynopsisTextView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    
    var bookToReceive: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews(book: bookToReceive)
    }
    
    func updateViews(book: Book?) {
        guard let book = book else {return}
        bookTitleTextField.text = book.title
        bookAuthorTextField.text = book.author
        bookRatingTextField.text = String(book.rating)
        bookSynopsisTextView.text = book.synopsis
    }
    
    func resetView() {
        bookTitleTextField.text = ""
        bookRatingTextField.text = ""
        bookAuthorTextField.text = ""
        bookSynopsisTextView.text = ""
    }
   
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = bookTitleTextField.text,
                      let author = bookAuthorTextField.text,
                      let rating = bookRatingTextField.text,
                      let synopsis = bookSynopsisTextView.text else {return}
                let unwrappedRating = Double(rating) ?? 0.0
                if let book = bookToReceive {
                    //Update
                    BookController.sharedInstance.update(booktToUpdate: book, newAuthor: author, newTitle: title, newRating: unwrappedRating, newSynopsis: synopsis)
                } else {
                    // Create
                    BookController.sharedInstance.create(author: author, title: title, rating:unwrappedRating, synopsis: synopsis)
                }
                navigationController?.popViewController(animated: true)
        }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        resetView()
    }
}
