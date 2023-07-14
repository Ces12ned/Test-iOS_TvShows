//
//  TVShowsViewModel.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

final class TVShowsViewModel : NetworkingDelegate{
        
    var tvShowsData: ObservableObject<[TVShowModel]> = ObservableObject([TVShowModel]())
    
    func useNetworking(){
        Networking.shared.fetchData()
        Networking.shared.delegate = self
    }
    
    func getData(tvShows: [TVShowModel]) {
        self.tvShowsData.value = tvShows
    }
    
}
