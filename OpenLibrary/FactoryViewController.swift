//
//  ViewControllerFactory.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 14.04.23.
//

import Foundation
import UIKit

class FactoryViewController {
    static let sheard = FactoryViewController()
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    private init() {}

    func createViewController() -> BookViewController {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "BookViewController") as? BookViewController else {
            return BookViewController()
        }
        return viewController
    }

}
