//
//  TVShow.swift
//  mvonbehr-final-project
//
//  Created by Mya Von Behren on 5/30/25.
//

import Foundation

struct TVShow: Decodable {
    let id: Int
    let name: String
    let overview: String
    let poster_path: String
    let first_air_date: String
}

/*
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
