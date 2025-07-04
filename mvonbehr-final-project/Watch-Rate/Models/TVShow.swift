//
//  TVShow.swift
//  Watch-Rate
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation
/// Represents a television show from The Movie Database (TMDB) API
/// This model contains information about a TV show including, its id,
/// name, description, visual assets, and original air date.
struct TVShow: Codable, Identifiable {
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
        return URL(string: "https://image.tmdb.org/t/p/w1280\(backdropPath)")
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
            return ""
        }
        return TVShow.yearFormatter.string(from: date)
    }
}

extension TVShow {
    static let mockTVShow = TVShow(
        id: 119051,
        name: "Wednesday",
        overview: "Wednesday Addams is sent to Nevermore Academy, a bizarre boarding school where she attempts to master her psychic powers, stop a monstrous killing spree of the town citizens, and solve the supernatural mystery that affected her family 25 years ago — all while navigating her new relationships.",
        backdropPath: "/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg",
        posterPath: "/i2MwS6U0XzD8ad6aS3HiTNKz8ov.jpg",
        firstAirDate: "2022-11-23"
    )
}
