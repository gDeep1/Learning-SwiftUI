//
//  Models.swift
//  SwiftUIProject
//
//  Created by Gagandeep on 18/08/22.
//

import Foundation
import Combine

protocol Item {
    var title: String { get }
}

struct Book: Item, Codable {
    var title: String
    var author: String
}

struct Movie: Item, Codable {
    var title: String
    var year: Int
}
