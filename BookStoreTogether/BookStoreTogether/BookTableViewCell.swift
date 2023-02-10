//
//  BookTableViewCell.swift
//  BookStoreTogether
//
//  Created by Maxwell Poffenbarger on 2/10/23.
//

import UIKit

class BookTableViewCell: UITableViewCell {

	// MARK: - Outlets
	@IBOutlet weak var bookTitleLabel: UILabel!
	@IBOutlet weak var bookAuthorLabel: UILabel!
	@IBOutlet weak var bookRatingLabel: UILabel!

	// MARK: - Methods
	func updateViews(book: Book) {
		bookTitleLabel.text = book.title
		bookAuthorLabel.text = book.author
		bookRatingLabel.text = String(book.rating)
	}
}
