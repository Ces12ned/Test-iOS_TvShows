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
                
            let alert = UIAlertController(title: "Delete", message: "Do you want to remove this item?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                
                print("DEBUG: Item deleted")
                
            }))
            alert.addAction(UIAlertAction(title: "No", style: .destructive))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        delete.image = UIImage(named: "trash")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addToFavorites = UIContextualAction(style: .normal, title: "Favorite") { (contextualAction,view, actionPerformed: (Bool) -> ()) in
                       
        }
        
        addToFavorites.image = UIImage(named: "star")
        addToFavorites.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [addToFavorites])
    }
    
    
    
}
