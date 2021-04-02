//
//  Album.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 1/4/21.
//

import Foundation

struct AlbumList: Decodable {
    let albums: [Album]
}

struct Album: Decodable {
    
    typealias Year = Int
    
    let name: String
    let songs: [Song]
    let releaseYear: Year
    let coverImage: String
}
