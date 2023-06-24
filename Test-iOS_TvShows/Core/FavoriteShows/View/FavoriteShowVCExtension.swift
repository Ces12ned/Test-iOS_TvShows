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
        favoriteTVShowsCell.accessoryType = .disclosureIndicator
        favoriteTVShowsCell.textLabel?.text = "Dummy"
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

                print("DEBUG: Item deleted")

//                tableView.deleteRows(at: [indexPath], with: .automatic)
                            
            }))
            alert.addAction(UIAlertAction(title: "No", style: .destructive))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        delete.image = UIImage(named: "trash")
        return UISwipeActionsConfiguration(actions: [delete])
    }

}
