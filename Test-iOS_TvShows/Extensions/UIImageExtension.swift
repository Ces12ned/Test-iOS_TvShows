//
//  UIImageExtension.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 22/06/23.
//

import UIKit

extension UIImageView {
    
    func load(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let safeURL = URL(string: url){
                if let data = try? Data(contentsOf: safeURL) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
