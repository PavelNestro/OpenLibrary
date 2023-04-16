//
//  ViewModel.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 13.04.23.
//

import Foundation

protocol ViewModel {

    var openLibraryModel: OpenLibraryModel? { get set }

    var didUpdateBooksModel: ((OpenLibraryModel) -> Void)? { get set }

    func viewDidload()
}
