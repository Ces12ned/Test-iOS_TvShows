//
//  TVShowsViewModel.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

import UIKit

final class TVShowsViewModel : NetworkingDelegate{
    
    var tvShowsData = [TVShowModel]()
    
    init() {
        Networking.shared.delegate = self
        Networking.shared.fetchData()
    }
    
    func getData(tvShows: [TVShowModel]) {
        DispatchQueue.main.async {
            self.tvShowsData = tvShows
        }
    }
    
}
