//
//  UICollectionDataSource.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import Foundation
import UIKit

class UICollectionDataSource<CELL:UICollectionViewCell,T>:NSObject,UICollectionViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    private var selectIndex: Int = -1
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                      for: indexPath) as! CELL
       let item = self.items[indexPath.row]
       self.configureCell(cell, item)
       return cell
    }
    
    func getObject(index: Int) -> T {
        return items[index]
    }
    
    func setSelectIndex(index: Int) {
        self.selectIndex = index
    }
    
    func getSelectObject() -> T {
        return items[selectIndex]
    }
}
