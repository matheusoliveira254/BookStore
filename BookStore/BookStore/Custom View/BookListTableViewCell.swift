//
//  BookListTableViewCell.swift
//  BookStore
//
//  Created by Matheus Oliveira on 9/22/22.
//

import UIKit

class BookListTableViewCell: UITableViewCell {

    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookRatingLabel: UILabel!
    
    func updateViews(with book: Book) {
        bookTitleLabel.text = book.title
        bookAuthorLabel.text = book.author
        bookRatingLabel.text = "\(book.rating)"
    }
}
