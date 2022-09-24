//
//  BookController.swift
//  BookStore
//
//  Created by Matheus Oliveira on 9/22/22.
//

import Foundation

class BookController {
    //MARK: - Singleton
    static let sharedInstance = BookController()
    //MARK: - Source of truth
    var book: [Book] = []
    
    //MARK: - CRUD
    
    func create(author: String, title: String, rating: Double, synopsis: String) {
        let books = Book(author: author, title: title, rating: rating, synopsis: synopsis)
        book.append(books)
    }
    
    func update(booktToUpdate: Book, newAuthor: String, newTitle: String, newRating: Double, newSynopsis: String) {
        booktToUpdate.author = newAuthor
        booktToUpdate.title = newTitle
        booktToUpdate.rating = newRating
        booktToUpdate.synopsis = newSynopsis
        booktToUpdate.lastUpdated = Date()
    }
    
    func delete(bookToDelete: Book) {
        guard let indexOfBookToBeDeleted = book.firstIndex(of: bookToDelete) else {return}
        book.remove(at: indexOfBookToBeDeleted)
        
        
        
    }
} // End of Class
