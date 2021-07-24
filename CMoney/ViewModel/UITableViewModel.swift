//
//  UITableViewModel.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import Foundation
import UIKit


typealias CellSelectBlock = (_ tableView: UICollectionView, _ indexPath: IndexPath) -> Void

class UICollectionViewModel: NSObject, UICollectionViewDelegate {
    
    // MARK: Block
    var cellSelectBlock: CellSelectBlock = {_,_ in}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellSelectBlock(collectionView, indexPath)
    }
    
}
