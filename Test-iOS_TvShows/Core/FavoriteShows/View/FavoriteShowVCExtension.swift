//
//  FavoriteShowVCExtension.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 23/06/23.
//

import UIKit

extension FavoriteShowsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let favoriteTVShowsCell = tableView.dequeueReusableCell(withIdentifier: "favoriteTVShowCell", for: indexPath) as! FavoriteTVShowTableViewCell
        favoriteTVShowsCell.textLabel?.text = "Dummy"
        

        return favoriteTVShowsCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        navigationController?.pushViewController(DetailShowViewController(), animated: true)
        
        print("Push to Detail")
        
    }
    
    
    
    
}
