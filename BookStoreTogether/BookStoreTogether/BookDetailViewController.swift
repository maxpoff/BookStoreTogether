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
    }

	// MARK: - Actions
	@IBAction func saveButtonTapped(_ sender: Any) {
	}

	@IBAction func clearButtonTapped(_ sender: Any) {
	}
}
