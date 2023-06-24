//
//  TVShowsViewController.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

import UIKit

class TVShowsViewController: UIViewController{
    
    
    
    //MARK: - Properties
    
    private let topView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemTeal
        return view
    }()
    
    private let topTitle: UILabel = {
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Futura-Medium", size: 24)
        title.textColor = .black
        title.text = "TV Shows"
        return title
    }()
    
    
    private let tvShowTableView: UITableView = {
        
        let tvShowTable = UITableView()
        tvShowTable.translatesAutoresizingMaskIntoConstraints = false
        tvShowTable.register(TVShowTableViewCell.self, forCellReuseIdentifier: "tvShowCell")
        return tvShowTable
    }()
        
    var tvShowsViewModel = TVShowsViewModel()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topViewConfiguration()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tvShowTableViewConfiguration()
            self.tvShowTableView.reloadData()
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
    
    
    private func tvShowTableViewConfiguration(){
        
        view.addSubview(tvShowTableView)
        tvShowTableView.dataSource = self
        tvShowTableView.delegate = self
        setTVShowTableViewConstraints()
        
    }
    
    private func setTVShowTableViewConstraints(){
        
        NSLayoutConstraint.activate([
            tvShowTableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            tvShowTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tvShowTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            tvShowTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -HomeTabViewController().tabBar.frame.height*2)
        ])
        
        
    }
    
    

    
    

}


