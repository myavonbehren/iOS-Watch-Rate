//
//  TVShow.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation
/// Represents a television show from The Movie Database (TMDB) API
/// This model contains information about a TV show including, its id,
/// name, description, visual assets, and original air date.
struct TVShow: Codable {
    var id: Int
    var name: String
    var overview: String
    var backdropPath: String?
    var posterPath: String?
    var firstAirDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case overview = "overview"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
    }
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
}
