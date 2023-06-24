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
        
         return CoreData.favoriteTVShows.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let favoriteTVShowsCell = tableView.dequeueReusableCell(withIdentifier: "favoriteTVShowCell", for: indexPath) as! FavoriteTVShowTableViewCell
    
        favoriteTVShowsCell.accessoryType = .disclosureIndicator
        favoriteTVShowsCell.indexForCell = indexPath.row
        favoriteTVShowsCell.tvShowInfo = CoreData.favoriteTVShows
        
        return favoriteTVShowsCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        navigationController?.pushViewController(DetailShowViewController(), animated: true)
        
        print("Push to Detail")
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction,view, actionPerformed: (Bool) -> ()) in
                
            let alert = UIAlertController(title: "Delete", message: "Do you want to remove this item?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in

                if CoreData.doesFavoriteTVShowExists(id: Int(CoreData.favoriteTVShows[indexPath.row].id)){
                    CoreData.deleteFavoriteTVShow(id:Int(CoreData.favoriteTVShows[indexPath.row].id))
                }else{
                    tableView.deleteRows(at: [indexPath], with: .left)
                }
                tableView.deleteRows(at: [indexPath], with: .left)

                            
            }))
            alert.addAction(UIAlertAction(title: "No", style: .destructive))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        delete.image = UIImage(named: "trash")
        return UISwipeActionsConfiguration(actions: [delete])
    }

}
