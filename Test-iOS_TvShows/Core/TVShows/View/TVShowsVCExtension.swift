//
//  TVShowsVCExtension.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

import UIKit


extension TVShowsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tvShowsViewModel.tvShowsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tvShowsCell = tableView.dequeueReusableCell(withIdentifier: "tvShowCell", for: indexPath) as! TVShowTableViewCell
        tvShowsCell.indexForCell = indexPath.row
        tvShowsCell.tvShowInfo = tvShowsViewModel.tvShowsData

        return tvShowsCell
    }
    
    
    
    
    
}
