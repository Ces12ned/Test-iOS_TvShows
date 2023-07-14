//
//  Networking.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

import UIKit

protocol NetworkingDelegate {
    
    func getData(tvShows: [TVShowModel])
}

final class Networking {
    
    static let shared = Networking()
    var delegate: NetworkingDelegate?
    private let url = "https://api.tvmaze.com/shows"
    
    func fetchData(){
            
        if let safeURL = URL(string: url){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeURL) { data, response, error in
                
                if error != nil {
                    return
                }
                if let safeData = data{
                    if let tvShow = self.parseJSON(safeData){
                        self.delegate?.getData(tvShows: tvShow)
                    }
                }
            }
            task.resume()
        }

    }
    
    
    func parseJSON(_ tvShowData: Data) -> [TVShowModel]?{
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode([TVShowModel].self, from: tvShowData)
                return decodedData
            } catch{
                return nil
            }

        }
    
}
