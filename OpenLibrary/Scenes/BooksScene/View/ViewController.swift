//
//  ViewController.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 13.04.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: ViewModelImplementation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Books"
        viewModel = ViewModelImplementation(self)
        tableView.delegate = self
        tableView.dataSource = self
        let nib =  UINib(nibName: String(describing: TableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TableViewCell.identifier)

        viewModel?.viewDidload()
        viewModel?.didUpdateBooksModel = { books in
            self.tableView.reloadData()
        }
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.openLibraryModel?.editions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else {
            return UITableViewCell()
        }
        guard let array = viewModel?.openLibraryModel?.editions else {
            return UITableViewCell()
        }
        let arrayPicture = array.map({$0.covers[0]})
        let arrayTitle = array.map({$0.title})
        let arrayPublishDate = array.map({$0.publishDate})
        cell.imageViewCell.downloadImage(for:"https://covers.openlibrary.org/b/id/\(arrayPicture[indexPath.row])-M.jpg")
        cell.publishDateLabel.text = "Publication date: \(arrayPublishDate[indexPath.row])"
        cell.headerLabel.text = "\(arrayTitle[indexPath.row])"
        return cell

    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = FactoryViewController.sheard.createViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        
        if let array = viewModel?.openLibraryModel?.editions {
            let workUrl = array.map({$0.works[0]})
            viewController.stringUrl = "https://openlibrary.org\(workUrl.map({$0.key})[indexPath.row]).json"
            viewController.ratingUrl = "https://openlibrary.org\(workUrl.map({$0.key})[indexPath.row])/ratings.json"
            print("https://openlibrary.org\(workUrl.map({$0.key})[indexPath.row]).json")
        }
       
    }
}
