//
//  AnotherViewBookModel.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 16.04.23.
//

import Foundation

struct AnotherViewBookModel: Codable {
    let title: String
    let covers: [Int]
    let description: String
}
