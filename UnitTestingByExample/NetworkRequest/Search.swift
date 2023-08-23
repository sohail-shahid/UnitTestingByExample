//
//  Search.swift
//  UnitTestingByExample
//
//  Created by Sohail Khan on 22/08/2023.
//

import Foundation

struct Search: Decodable {
    let results: [SearchResult]
}
struct SearchResult: Decodable, Equatable {
    let artistName: String
    let trackName: String
    let averageUserRating: Float
    let genres: [String]
}
