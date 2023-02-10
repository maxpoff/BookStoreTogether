//
//  BookListTableViewController.swift
//  BookStoreTogether
//
//  Created by Maxwell Poffenbarger on 2/10/23.
//

import UIKit

class BookListTableViewController: UITableViewController {

	// MARK: - Lifecycle
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		tableView.reloadData()
	}

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return BookController.shared.books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }

		let book = BookController.shared.books[indexPath.row]
		cell.updateViews(book: book)

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			let book = BookController.shared.books[indexPath.row]
			BookController.shared.deleteBook(book: book)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// IIDOO
		if segue.identifier == "toDetailVC" {
			if let indexPath = tableView.indexPathForSelectedRow,
			   let destinationVC = segue.destination as? BookDetailViewController {
				let book = BookController.shared.books[indexPath.row]
				destinationVC.book = book
			}
		}
    }
}
