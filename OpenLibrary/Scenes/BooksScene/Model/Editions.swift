//
//  Entries.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 13.04.23.
//

import Foundation

struct Editions: Codable {
    let covers: [Int]
    let title: String
    let publishDate: String
    let works: [Key]

    
    enum CodingKeys: String, CodingKey {
        case covers, title, works
        case publishDate = "publish_date"
    }
}
