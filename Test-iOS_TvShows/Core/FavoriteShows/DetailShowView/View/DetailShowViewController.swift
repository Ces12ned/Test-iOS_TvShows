//
//  DetailShowViewController.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

import UIKit

class DetailShowViewController: UIViewController {
    
    //MARK: - Properties
    
    
    
    private let tvShowCover : UIImageView = {
        
        let cover = UIImageView()
        cover.translatesAutoresizingMaskIntoConstraints = false
        cover.layer.cornerRadius = 24
        cover.clipsToBounds = true
        cover.contentMode = .scaleAspectFit
        return cover
    }()
    
    
    private let tvShowName : UILabel = {
        
        let name = UILabel()
        name.font = UIFont(name: "Futura", size: 24)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textAlignment = .left
        name.numberOfLines = 2
        return name
    }()
    
    private let tvShowSummary : UILabel = {
        
        let summary = UILabel()
        summary.font = UIFont(name: "Futura", size: 16)
        summary.textColor = UIColor.darkGray
        summary.translatesAutoresizingMaskIntoConstraints = false
        summary.textAlignment = .left
        summary.numberOfLines = 0
        return summary
    }()
    
    
    private let imdbButton : UIButton = {
        
        let imdbButton = UIButton()
        imdbButton.translatesAutoresizingMaskIntoConstraints = false
        imdbButton.titleLabel?.font = UIFont(name: "Futura", size: 18)
        imdbButton.setTitle("Go to IMDb", for: .normal)
        imdbButton.setTitleColor(.black, for: .normal)
        imdbButton.backgroundColor = UIColor(red: 237/255, green: 199/255, blue: 72/255, alpha: 1)
        imdbButton.layer.borderWidth = 2
        imdbButton.layer.borderColor =  UIColor.black.cgColor
        imdbButton.layer.cornerRadius = 18
        return imdbButton
        
    }()
    

    var tvShowDataFromCell : TVShowModel
    var favoriteTVShowDataFromCell : FavoritesTVShowModel?
    
    init(tvShowDataFromCell: TVShowModel) {
        self.tvShowDataFromCell = tvShowDataFromCell
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: - Life Cycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureTVShowCover()
        configureTVShowName()
        configureTVShowSummary()
        configureimdbButton()
        navigationItemsSettings()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        title = tvShowDataFromCell.name
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 28) as Any]
    }
    
    //MARK: - Methods
    
    
    
    private func configureTVShowCover(){
        
        view.addSubview(tvShowCover)
        tvShowCover.load(url: tvShowDataFromCell.image.original)
        setTVShowCoverConstraints()
        
    }
    
    private func setTVShowCoverConstraints(){
        
        NSLayoutConstraint.activate([
            tvShowCover.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tvShowCover.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tvShowCover.widthAnchor.constraint(equalToConstant: view.frame.width/2),
            tvShowCover.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    private func configureTVShowName(){
        
        view.addSubview(tvShowName)
        tvShowName.text = tvShowDataFromCell.name
        setTVShowNameConstraints()
        
    }
    
    
    private func setTVShowNameConstraints(){
        
        NSLayoutConstraint.activate([
            tvShowName.topAnchor.constraint(equalTo: tvShowCover.bottomAnchor, constant: 12),
            tvShowName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tvShowName.widthAnchor.constraint(equalToConstant: view.frame.width),
            tvShowName.heightAnchor.constraint(equalToConstant: 36)
        ])
        
    }
    
    
    private func configureTVShowSummary(){
        
        view.addSubview(tvShowSummary)
        tvShowSummary.text = tvShowDataFromCell.summary.stripOutHtml()
        setTVShowSummaryConstraints()
        
    }
    
    
    private func setTVShowSummaryConstraints(){
        
        NSLayoutConstraint.activate([
            tvShowSummary.topAnchor.constraint(equalTo: tvShowName.bottomAnchor, constant: 12),
            tvShowSummary.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tvShowSummary.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            tvShowSummary.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    private func configureimdbButton(){
        
        if tvShowDataFromCell.externals.imdb == nil {
            
            imdbButton.isHidden = true
            
        }else{
            view.addSubview(imdbButton)
            
            setimdbButtonConstraints()
            
            imdbButton.addTarget(self, action: #selector(goToIMDB), for: .touchUpInside)
            
        }
    }
    
    
    private func setimdbButtonConstraints() {
        
        NSLayoutConstraint.activate([
            imdbButton.topAnchor.constraint(equalTo: tvShowSummary.bottomAnchor, constant: 12),
            imdbButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            imdbButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            imdbButton.heightAnchor.constraint(equalToConstant: 50 )
        ])
        
        
        
    }

    @objc func goToIMDB(){

        navigationController?.pushViewController(IMDbViewController(imdb: tvShowDataFromCell.externals.imdb ?? ""), animated: true)
    }
    
    

    
    //MARK: - NavigationItemsSettings
    
    private func navigationItemsSettings(){
        
        //Navigation Items
        
        //Left
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "return"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(returnToAuth))
        
        navigationItem.leftBarButtonItem?.tintColor = .black
        

        //Right
        
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "star.slash"),
                                                           style: .done,
                                                           target: self,
                                                            action: #selector(removeFromFavorites))
        
        
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange
        
    }
    
    
    @objc func returnToAuth(){

        navigationController?.popViewController(animated: true)
    }
    
    @objc func removeFromFavorites(){

        print("DEBUG: Removed from favorites")
    }

}
