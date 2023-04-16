//
//  BookInfoImplementation.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 15.04.23.
//

import Foundation

class BookInfoImplementation
{
    var bookInfoModel: BookInfoModel? {
        didSet {
            if let bookInfoModel = bookInfoModel {
                DispatchQueue.main.async {
                    self.didUpdateBooksModel?(bookInfoModel)
                }
            }
        }
    }
    var anotherBookModel: AnotherViewBookModel? {
        didSet {
            if let anotherBookModel = anotherBookModel {
                DispatchQueue.main.async {
                    self.didUpdateAnotherBookView?(anotherBookModel)
                }
            }
        }
    }
    
    var ratingBookModel: RatingBookModel? {
        didSet {
            if let ratingBookModel = ratingBookModel {
                DispatchQueue.main.async {
                    self.didUpdateRaitingBook?(ratingBookModel)
                }
            }
        }
    }
    
    
    var didUpdateBooksModel: ((BookInfoModel) -> Void)?
    var didUpdateAnotherBookView: ((AnotherViewBookModel) -> Void)?
    var didUpdateRaitingBook: ((RatingBookModel) -> Void)?
    

    weak var bookViewController: BookViewController?

    
    
    func viewDidload(_ string: String) {
        let url = string
                    guard let url = URL(string: url) else {
                        print("invalid url")
                        return
                    }
                    let request = URLRequest(url: url)
                    let task = URLSession.shared.dataTask(with: request) { data, _, error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                        guard let data = data else {
                            print("no data in response")
                            return
                        }
                        do {
                             let book = try JSONDecoder().decode(BookInfoModel.self, from: data)
                                DispatchQueue.main.async {
                                    self.bookInfoModel = book
                                }
                            let theList = book.title
                            print(theList)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    task.resume()
    }

    func viewDidAnotherload(_ string: String) {
        let url = string
                    guard let url = URL(string: url) else {
                        print("invalid url")
                        return
                    }
                    let request = URLRequest(url: url)
                    let task = URLSession.shared.dataTask(with: request) { data, _, error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                        guard let data = data else {
                            print("no data in response")
                            return
                        }
                        do {
                             let book = try JSONDecoder().decode(AnotherViewBookModel.self, from: data)
                                DispatchQueue.main.async {
                                    self.anotherBookModel = book
                                }
                            let theList = book.title
                            print(theList)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    task.resume()
    }
    func raitingBook(_ string: String) {
        let url = string
                    guard let url = URL(string: url) else {
                        print("invalid url")
                        return
                    }
                    let request = URLRequest(url: url)
                    let task = URLSession.shared.dataTask(with: request) { data, _, error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                        guard let data = data else {
                            print("no data in response")
                            return
                        }
                        do {
                             let book = try JSONDecoder().decode(RatingBookModel.self, from: data)
                                DispatchQueue.main.async {
                                    self.ratingBookModel = book
                                }
                            let theList = book.summary
                            print(theList)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    task.resume()
    }
    
    
    
        init(_ viewController: BookViewController) {
            self.bookViewController = viewController
        }
}
