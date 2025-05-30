//
//  TVShowService.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation

protocol TVShowService {
    
}

enum TVShowEndpoint: String {
    case search = "/search/tv"
    case details = "/tv"
}

enum TVShowError: Error {
    // General API failure when the request cannot be completed
    case apiError
    
    // Error when the HTTP response status code is not in the range between 200 and 300
    case invalidResponse
    
    // Error when constructing the endpoint URL
    case invalidEndpoint
    
    // Error when server returned empty response or missing expected data
    case noData
    
    // JSON Decoding error
    case serializationError
}
