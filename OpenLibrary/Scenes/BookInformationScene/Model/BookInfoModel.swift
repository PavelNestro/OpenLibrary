//
//  BookInfoModel.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 15.04.23.
//

import Foundation

struct BookInfoModel: Codable {
    let title: String
    let covers: [Int]
    let description: Description
}
