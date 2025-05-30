//
//  Utils.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation

class Utils {
    /// Pre-configured JSONDecoder optimized for TMDB API responses
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()

    /// DateFormatter configured for TMDB's standard date format
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
