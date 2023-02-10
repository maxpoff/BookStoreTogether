//
//  Book.swift
//  BookStoreTogether
//
//  Created by Maxwell Poffenbarger on 2/10/23.
//

import Foundation

// MARK: - Class
class Book {
	var author: String
	var title: String
	var lastUpdated: Date
	var rating: Double
	var synopsis: String
	let uuid: UUID = UUID()

	init(author: String, title: String, lastUpdated: Date = Date(), rating: Double, synopsis: String) {
		self.author = author
		self.title = title
		self.lastUpdated = lastUpdated
		self.rating = rating
		self.synopsis = synopsis
	}
}

// MARK: - Extensions
extension Book: Equatable {
	static func == (lhs: Book, rhs: Book) -> Bool {
		return lhs.uuid == rhs.uuid
	}
}
