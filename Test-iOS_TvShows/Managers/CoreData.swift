//
//  CoreData.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 24/06/23.
//

import Foundation
import UIKit
import CoreData


internal let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class CoreData {
    
    static var favoriteTVShows = [FavoritesTVShowModel]()
    
    static func saveContext(){
        
        do {
            try context.save()
        } catch {
            print("DEBUG: Error on saving data \(error)")
        }
    }
    
    static func appendFavoriteTVShow(favoriteTVShow: FavoritesTVShowModel) {
        CoreData.favoriteTVShows.append(favoriteTVShow)
        CoreData.saveContext()
    }
    
    static func fetchFavoriteTVShows() {
        let request:NSFetchRequest<FavoritesTVShowModel> = FavoritesTVShowModel.fetchRequest()
        do {
            favoriteTVShows = try context.fetch(request)
            favoriteTVShows.reverse()
        } catch {
            print("DEBUG: Error fetching data \(error)")
        }
    }
    
    static func doesFavoriteTVShowExists(id: Int) -> Bool {
        fetchFavoriteTVShows()
        for favoriteTVShow in favoriteTVShows {
            if id == favoriteTVShow.id {
                return true
            }
        }
        return false
    }
    
    static func deleteFavoriteTVShow(id: Int?) {
        if let id = id {
            for favoriteTVShow in favoriteTVShows {
                if id == favoriteTVShow.id {
                    context.delete(favoriteTVShow)
                    saveContext()
                    fetchFavoriteTVShows()
                    return
                }
            }
        }
    }
    
    
}
