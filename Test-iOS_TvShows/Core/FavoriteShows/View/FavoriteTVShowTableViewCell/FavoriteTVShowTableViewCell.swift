//
//  FavoriteTVShowTableViewCell.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 23/06/23.
//

import UIKit

class FavoriteTVShowTableViewCell: UITableViewCell {

    private let tvShowCover : UIImageView = {
        
        let cover = UIImageView()
        cover.clipsToBounds = true
        cover.contentMode = .scaleAspectFit
        cover.layer.cornerRadius = 6
        return cover
    }()
    
    private let tvShowName : UILabel = {
       
        let name = UILabel()
        name.font = UIFont(name: "Futura", size: 20)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textAlignment = .left
        name.numberOfLines = 2
        return name
    }()
    
    var indexForCell: Int?
    var tvShowInfo : [TVShowModel]?{
        
        didSet{

            guard let showData = tvShowInfo else {return}
//            print(showData)
            guard let safeIndex = indexForCell else {return}
//            print(safeIndex)
            tvShowCover.load(url: showData[safeIndex].image.medium)
            tvShowName.text = showData[safeIndex].name

        }

    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(tvShowCover)
        contentView.addSubview(tvShowName)
        
        tvShowCover.frame = CGRect(x: 10, y: 10, width: Int(contentView.frame.width)/3, height: 150)
        tvShowName.frame = CGRect(x: Int(tvShowCover.frame.width) + 36, y: Int(contentView.frame.height/2 + 36), width: Int(contentView.frame.width/1.5), height: 72)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


