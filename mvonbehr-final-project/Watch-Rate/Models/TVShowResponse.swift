//
//  TVShowSearch.swift
//  Watch-Rate
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation
/// Represents the paginated response wrapper from TMDB's TV show API endpoints
struct TVShowResponse: Decodable {
    let page: Int
    let results: [TVShow]
}
