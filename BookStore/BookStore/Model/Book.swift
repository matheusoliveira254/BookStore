//
//  Book.swift
//  BookStore
//
//  Created by Matheus Oliveira on 9/22/22.
//

import UIKit

class Book {
    var author: String
    var title: String
    var lastUpdated: Date
    var rating: Double
    var synopsis: String
    
    init(author: String, title: String, lastUpdated: Date = Date(), rating: Double, synopsis: String) {
        self.author = author
        self.title = title
        self.lastUpdated = lastUpdated
        self.rating = rating
        self.synopsis = synopsis
    }
}

extension Book: Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title &&
        lhs.author == rhs.author &&
        lhs.rating == rhs.rating &&
        lhs.synopsis == rhs.synopsis
    }
}
