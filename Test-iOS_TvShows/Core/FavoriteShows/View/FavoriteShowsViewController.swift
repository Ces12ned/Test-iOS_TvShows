//
//  FavoriteShowsViewController.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

import UIKit

class FavoriteShowsViewController: UIViewController {

    //MARK: - Properties
    
    private let topView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPurple
        return view
        
    }()
    
    private let topTitle: UILabel = {
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Futura-Medium", size: 24)
        title.textColor = .black
        title.text = "Favorite Shows"
        return title
    }()
    
    
    private let favoriteTVShowsTableView: UITableView = {
        
        let favoriteTVShows = UITableView()
        favoriteTVShows.translatesAutoresizingMaskIntoConstraints = false
        favoriteTVShows.register(FavoriteTVShowTableViewCell.self, forCellReuseIdentifier: "favoriteTVShowCell")
        return favoriteTVShows
    }()
    
    
    //MARK: - Life Cycle
      
      
    override func viewDidLoad() {
        super.viewDidLoad()
        topViewConfiguration()
        favoriteTVShowTableViewConfiguration()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            CoreData.fetchFavoriteTVShows()
            self.favoriteTVShowsTableView.reloadData()
        }
    }
    

    //MARK: - Methods
    
    
    private func topViewConfiguration(){
        
        view.addSubview(topView)
        setTopViewConstraints()
        topTitleConfiguration()
        
    }
    
    private func setTopViewConstraints(){
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.widthAnchor.constraint(equalToConstant: view.frame.width),
            topView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    private func topTitleConfiguration(){
        
        topView.addSubview(topTitle)
        setTopTitleConstraints()
    }
    
    private func setTopTitleConstraints(){
        
        NSLayoutConstraint.activate([
            topTitle.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -60),
            topTitle.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 30),
            topTitle.widthAnchor.constraint(equalToConstant: view.frame.width),
            topTitle.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    
    private func favoriteTVShowTableViewConfiguration(){
        
        view.addSubview(favoriteTVShowsTableView)
        favoriteTVShowsTableView.dataSource = self
        favoriteTVShowsTableView.delegate = self
        setFavoriteTVShowTableViewConstraints()
        
    }
    
    private func setFavoriteTVShowTableViewConstraints(){
        
        NSLayoutConstraint.activate([
            favoriteTVShowsTableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            favoriteTVShowsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            favoriteTVShowsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            favoriteTVShowsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -HomeTabViewController().tabBar.frame.height*2)
        ])
        
        
    }
    
    
}
