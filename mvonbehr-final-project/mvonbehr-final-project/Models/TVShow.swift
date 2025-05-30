//
//  TVShow.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation

struct TVShow: Codable {
    var id: Int
    var name: String
    var overview: String
    var posterPath: String?
    var firstAirDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case overview = "overview"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
    }
}
