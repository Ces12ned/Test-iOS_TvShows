//
//  TVShowModel.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

import Foundation


struct TVShowModel: Decodable{
    
    let id: Int
    let name: String
    let externals: Externals
    let image: Image
    let summary: String

    
    
    // MARK: - Externals
    struct Externals: Decodable {
        let tvrage: Int
        let thetvdb: Int?
        let imdb: String?
    }
    
    // MARK: - Image
    struct Image: Decodable {
        let medium, original: String
    }
    
    
}
