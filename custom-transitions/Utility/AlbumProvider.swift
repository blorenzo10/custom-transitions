//
//  AlbumProvider.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 1/4/21.
//

import Foundation

final class AlbumProvider {
    
    func getAllAlbums() -> [Album] {
        
        guard
            let url = Bundle.main.url(forResource: "Data", withExtension: "json"),
            let jsonData = try? Data(contentsOf: url),
            let albumList = try? JSONDecoder().decode(AlbumList.self, from: jsonData)
        else { return [] }
        
        return albumList.albums
    }
}
