//
//  TVShowService.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation

protocol TVShowService {
    func fetchTVShows(from endpoint: TVShowEndpoint, completion: @escaping (Result<TVShowSearchResponse, TVShowError>) -> Void)
}

enum TVShowEndpoint: String {
    case search = "/search/tv"
    case details = "/tv"
}

enum TVShowError: Error, CustomNSError {
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
    
    var localizedDescription: String {
        switch self {
        case .apiError:
            return "An unexpected error occurred."
        case .invalidResponse:
            return "The server returned an invalid response."
        case .invalidEndpoint:
            return "The provided endpoint is invalid."
        case .noData:
            return "The server returned no data."
        case .serializationError:
            return "Failed to decode the JSON response."
        }
    }
    
    var errorUserInfo: [String: Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
