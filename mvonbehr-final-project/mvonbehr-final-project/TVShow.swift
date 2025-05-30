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


/*
 struct Station: Codable {
     var stationName: String
     var mapID: String
     var isRed: Bool
     
     // Map between Swift property and JSON field name
     enum CodingKeys: String, CodingKey {
         case stationName = "station_name"
         case mapID = "map_id"
         case isRed = "red"
     }
 
 
 
 {
   "page": 1,
   "results": [
     {
       "adult": false,
       "backdrop_path": "/l0qVZIpXtIo7km9u5Yqh0nKPOr5.jpg",
       "genre_ids": [35],
       "id": 1668,
       "origin_country": ["US"],
       "original_language": "en",
       "original_name": "Friends",
       "overview": "Six young people from New York City, on their own and struggling to survive in the real world, find the companionship, comfort and support they get from each other to be the perfect antidote to the pressures of life.",
       "popularity": 124.3569,
       "poster_path": "/2koX1xLkpTQM4IZebYvKysFW1Nh.jpg",
       "first_air_date": "1994-09-22",
       "name": "Friends",
       "vote_average": 8.431,
       "vote_count": 8386
     },
 */
