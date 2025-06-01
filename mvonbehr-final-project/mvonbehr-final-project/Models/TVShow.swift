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
    var firstAirDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case overview = "overview"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
    }
    
    var backdropURL: URL? {
        guard let backdropPath = backdropPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath)")
    }
    
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    var yearText: String {
        guard let date = Utils.dateFormatter.date(from: firstAirDate) else {
            return "n/a"
        }
        return TVShow.yearFormatter.string(from: date)
    }
}

extension TVShow {
    static let mockTVShow = TVShow(
        id: 1668,
        name: "Friends",
        overview: "Six young people from New York City, on their own and struggling to survive in the real world, find the companionship, comfort and support they get from each other to be the perfect antidote to the pressures of life.",
        backdropPath: "/l0qVZIpXtIo7km9u5Yqh0nKPOr5.jpg",
        posterPath: "/2koX1xLkpTQM4IZebYvKysFW1Nh.jpg",
        firstAirDate: "1994-09-22"
    )
}
