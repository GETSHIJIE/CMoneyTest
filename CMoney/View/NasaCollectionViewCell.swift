//
//  NasaCollectionViewCell.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import UIKit

class NasaCollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    
    func config(nasa: Nasa) {
        
        imageView.isUserInteractionEnabled = false
        titleLabel.isUserInteractionEnabled = false
        
        titleLabel.text = nasa.title ?? ""
        imageView.load(urlString: nasa.url ?? "")
    }
}
