//
//  BookDetailViewController.swift
//  BookStoreTogether
//
//  Created by Maxwell Poffenbarger on 2/10/23.
//

import UIKit

class BookDetailViewController: UIViewController {

	// MARK: - Outlets
	@IBOutlet weak var bookTitleTextField: UITextField!
	@IBOutlet weak var bookAuthorTextField: UITextField!
	@IBOutlet weak var bookRatingTextField: UITextField!
	@IBOutlet weak var bookSynopsisTextView: UITextView!
	@IBOutlet weak var clearButton: UIButton!

	// MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()

		updateViews(book: book)
		designClearButton()
    }

	// MARK: - Properties
	var book: Book?

	// MARK: - Actions
	@IBAction func saveButtonTapped(_ sender: Any) {
		guard let title = bookTitleTextField.text, !title.isEmpty,
			  let author = bookAuthorTextField.text, !author.isEmpty,
			  let rating = bookRatingTextField.text, !rating.isEmpty,
			  let synopsis = bookSynopsisTextView.text, !synopsis.isEmpty else { return }

		let unwrappedRating = Double(rating) ?? 0.0

		if let book = book {
			// Update
			BookController.shared.updateBook(book: book, author: author, title: title, rating: unwrappedRating, synopsis: synopsis)
		} else {
			// Create
			BookController.shared.createBook(author: author, title: title, rating: unwrappedRating, synopsis: synopsis)
		}

		navigationController?.popViewController(animated: true)
	}

	@IBAction func clearButtonTapped(_ sender: Any) {
		resetView()
	}

	// MARK: - Helper
	func updateViews(book: Book?) {
		guard let book = book else { return }
		bookTitleTextField.text = book.title
		bookAuthorTextField.text = book.author
		bookRatingTextField.text = String(book.rating)
		bookSynopsisTextView.text = book.synopsis
	}

	func resetView() {
		bookTitleTextField.text = ""
		bookAuthorTextField.text = ""
		bookRatingTextField.text = ""
		bookSynopsisTextView.text = ""
	}

	func designClearButton() {
		clearButton.isHidden = book == nil ? true : false

		clearButton.layer.borderWidth = 1
		clearButton.layer.borderColor = UIColor.systemMint.cgColor

		clearButton.layer.cornerRadius = clearButton.frame.height / 2
	}
}
