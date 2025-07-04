//
//  SearchMode.swift
//  Watch-Rate
//
//  Created by Mya Von Behren on 6/1/25.
//

import Foundation

enum SearchMode {
    case review
    case watchlist
    
    var title: String {
        switch self {
        case .review: return "Add a Review"
        case .watchlist: return "Add to Watchlist"
        }
    }
    
    var prompt: String {
        switch self {
        case .review: return "Search TV shows to review"
        case .watchlist: return "Search TV shows to add"
        }
    }
}
