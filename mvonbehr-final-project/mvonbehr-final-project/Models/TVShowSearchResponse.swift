//
//  TVShowSearch.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation

struct TVShowSearchResponse: Decodable {
    let page: Int
    let results: [TVShow]
}
