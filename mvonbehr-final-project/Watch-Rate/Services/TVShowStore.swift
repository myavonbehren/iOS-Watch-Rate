//
//  TVShowStore.swift
//  Watch-Rate
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation

/// Concrete implementation of TVShowService
/// This singleton class handles all TV show data operations including fetching shows, retrieving
/// individual show details, and performng search queries.
class TVShowStore: TVShowService {
    static let shared = TVShowStore()
    private let apiKey: String
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder
    
    private init() {
        // Load API key from Config.plist
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: path),
              let key = plist["TMDBAPIKey"] as? String else {
            fatalError("Could not load TMDB API key from Config.plist. Make sure Config.plist exists and contains TMDBAPIKey.")
        }
        self.apiKey = key
    }
    
    /// Retrieves information for a specific TV show by its TMDB id
    /// Returns a `TVShow` object containing the show details
    func fetchTVShow(id: Int) async throws -> TVShow {
        guard let url = URL(string: "\(baseAPIURL)/tv/\(id)") else {
            throw TVShowError.invalidEndpoint
        }
        return  try await self.loadURLAndDecode(url: url)
    }
    
    /// Performs a string search across TMDB's TV show database.
    /// Results are for English language and US region.
    /// Returns an array of `TVShow` objects matching the search
    func searchTVShow(query: String) async throws -> [TVShow] {
        guard let url = URL(string: "\(baseAPIURL)/search/tv") else {
            throw TVShowError.invalidEndpoint
        }
        let tvShowResponse: TVShowResponse = try await self.loadURLAndDecode(url: url, params: [
            "language": "en-US",
            "region": "US",
            "query": query
        ])
        return tvShowResponse.results
    }
        
    /// Generic URL loading and JSON decoding utility for TMDB API requests
    /// Returns a decoded object of the specified generic type `T`
    private func loadURLAndDecode<T: Decodable>(url: URL, params: [String: String]? = nil) async throws -> T {
        // Converts URL to URLComponents, throws error if URL is invalid
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw TVShowError.invalidEndpoint
        }
        
        // Adds API key as query parameter
        var queryItems = [URLQueryItem (name: "api_key", value: apiKey)]
        
        // Opitionally adds additional parameters if provided
        // Converts params dictionary to URLQueryItem array
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        urlComponents.queryItems = queryItems
        
        // Construct URL
        guard let finalURL = urlComponents.url else {
            throw TVShowError.invalidEndpoint
        }
        
        // Create a network request with the constructed url
        let (data, response) = try await urlSession.data(from: finalURL)
        
        // HTTP response validation
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw TVShowError.invalidResponse
        }
        
        // JSON Decoding
        return try jsonDecoder.decode(T.self, from: data)
    }
    
}
