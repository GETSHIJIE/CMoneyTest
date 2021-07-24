//
//  UICollectionViewLayout.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import Foundation
import UIKit

class UICollectionViewLayout: UICollectionViewFlowLayout {
    
    let numberOfColumns: CGFloat = 4
    let padding: CGFloat = 1
    
    override init() {
        super.init()
        self.minimumInteritemSpacing = self.padding
        self.minimumLineSpacing = self.padding
        
        let itemSizeW = (UIScreen.main.bounds.size.width - ((self.numberOfColumns - 1) * self.padding)) / numberOfColumns
        self.itemSize = CGSize(width: itemSizeW, height: itemSizeW)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
