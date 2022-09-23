//
//  Book.swift
//  BookStore
//
//  Created by Matheus Oliveira on 9/22/22.
//

import UIKit

class Book {
    var author: String
    var tile: String
    var lastUpdated: Date
    var rating: Double
    var synopsis: String
    
    init(author: String, title: String, lastUpdated: Date = Date(), rating: Double, synopsis: String) {
        self.author = author
        self.tile = title
        self.lastUpdated = lastUpdated
        self.rating = rating
        self.synopsis = synopsis
    }
}
