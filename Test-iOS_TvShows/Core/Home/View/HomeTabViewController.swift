//
//  HomeTabViewController.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

import UIKit

class HomeTabViewController: UITabBarController, UITabBarControllerDelegate {

    //MARK: - Properties
    
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        view.backgroundColor = .white
        tabBar.tintColor = .black
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarSettings()
    }


    //MARK: - Methods

    private func tabBarSettings(){
        
        let tvShowsTabBar = TVShowsViewController()
        let tvShowsTabBarItem = UITabBarItem(title: "TV Shows", image: UIImage(named: "tv"), selectedImage: UIImage(named: "tv"))
        tvShowsTabBar.tabBarItem = tvShowsTabBarItem
        
        let favoriteShowsTabBar = FavoriteShowsViewController()
        let favoriteShowsTabBarItem = UITabBarItem(title: "Favorite Shows", image: UIImage(named: "line.horizontal.star.fill.line.horizontal"), selectedImage: UIImage(named: "line.horizontal.star.fill.line.horizontal"))
        favoriteShowsTabBar.tabBarItem = favoriteShowsTabBarItem
        
       
        self.viewControllers = [tvShowsTabBar, favoriteShowsTabBar]

        
        
    }
    
}

