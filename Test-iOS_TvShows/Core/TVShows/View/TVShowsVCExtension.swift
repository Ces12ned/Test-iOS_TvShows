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
        tvShowsCell.accessoryType = .disclosureIndicator
        tvShowsCell.indexForCell = indexPath.row
        tvShowsCell.tvShowInfo = tvShowsViewModel.tvShowsData

        return tvShowsCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(DetailShowViewController(tvShowDataFromCell: tvShowsViewModel.tvShowsData[indexPath.row]), animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction,view, actionPerformed: (Bool) -> ()) in
                
            let alert = UIAlertController(title: "Delete", message: "Do you want to remove this item from your Favorite TV Shows list?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                
                if CoreData.doesFavoriteTVShowExists(id: self.tvShowsViewModel.tvShowsData[indexPath.row].id){
                    CoreData.deleteFavoriteTVShow(id: self.tvShowsViewModel.tvShowsData[indexPath.row].id)
                }else{
                    tableView.reloadRows(at: [indexPath], with: .left)
                }
                tableView.reloadRows(at: [indexPath], with: .left)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .destructive))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        delete.image = UIImage(named: "trash")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addToFavorites = UIContextualAction(style: .normal, title: "Favorite") { (contextualAction,view, actionPerformed: (Bool) -> ()) in
        
            if CoreData.doesFavoriteTVShowExists(id: self.tvShowsViewModel.tvShowsData[indexPath.row].id){
                tableView.reloadRows(at: [indexPath], with: .right)
            }else{
                let favoriteTVShow = FavoritesTVShowModel(context: context)
                favoriteTVShow.id = Int64(self.tvShowsViewModel.tvShowsData[indexPath.row].id)
                favoriteTVShow.name = self.tvShowsViewModel.tvShowsData[indexPath.row].name
                favoriteTVShow.image = self.tvShowsViewModel.tvShowsData[indexPath.row].image.medium
                favoriteTVShow.summary = self.tvShowsViewModel.tvShowsData[indexPath.row].summary
                favoriteTVShow.externals = self.tvShowsViewModel.tvShowsData[indexPath.row].externals.imdb
                
                CoreData.appendFavoriteTVShow(favoriteTVShow: favoriteTVShow)
            }
            
            tableView.reloadRows(at: [indexPath], with: .right)

        }
        
        addToFavorites.image = UIImage(named: "star")
        addToFavorites.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [addToFavorites])
    }
    
    
    
}
