//
//  BookViewController.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 14.04.23.
//

import UIKit

class BookViewController: UIViewController {
    var viewModel: BookInfoImplementation?
    var stringUrl: String?
    var ratingUrl: String?

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bookInfoLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = BookInfoImplementation(self)
        viewModel?.viewDidload(stringUrl ?? "")
        viewModel?.viewDidAnotherload(stringUrl ?? "")
        viewModel?.raitingBook(ratingUrl ?? "")
        
        viewModel?.didUpdateAnotherBookView = { [weak self] book in
            guard let self = self else { return }
            self.bookInfoLable.text = "\(book.title)"
            self.descriptionLabel.text = book.description
            let picture = book.covers[0]
            self.imageView.downloadImage(for: "https://covers.openlibrary.org/b/id/\(picture)-M.jpg")
        }
        
        viewModel?.didUpdateBooksModel = { [weak self] books in
            guard let self = self else { return }
            self.bookInfoLable.text = "\(books.title)"
            self.descriptionLabel.text = books.description.value
            let picture = books.covers[0]
            self.imageView.downloadImage(for: "https://covers.openlibrary.org/b/id/\(picture)-M.jpg")
            
        }
        
        viewModel?.didUpdateRaitingBook = { [weak self] book in
            guard let self = self else { return }
            let sum = book.summary.average
            self.ratingLabel.text = "Rating: \(String(format: "%.1f", sum)) / 5.0🔸"
        }

        
    }
    

}
