//
//  BookController.swift
//  BookStoreTogether
//
//  Created by Maxwell Poffenbarger on 2/10/23.
//

import Foundation

class BookController {

	// MARK: - Properties
	static let shared = BookController()
	var books: [Book] = []

	// MARK: - Functions
	func createBook(author: String, title: String, rating: Double, synopsis: String) {
		let book = Book(author: author, title: title, rating: rating, synopsis: synopsis)
		books.append(book)
	}

	func updateBook(book: Book, author: String, title: String, rating: Double, synopsis: String) {
		book.author = author
		book.title = title
		book.rating = rating
		book.synopsis = synopsis
	}

	func deleteBook(book: Book) {
		guard let index = books.firstIndex(of: book) else { return }
		books.remove(at: index)
	}
}
