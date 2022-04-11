//
//  CollectionViewDataDisplayManager.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public protocol CollectionViewDataDisplayManager: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var dataSource: [CollectionViewCellViewModelConfigurable] { get set }

    var didSelect: ((Int) -> Void)? { get set }
    
    var willDisplay: ((Int) -> Void)? { get set }
    
    var didScroll: ((CGFloat) -> Void)? { get set }
}

public class CollectionViewDataDisplayManagerImpl: NSObject, CollectionViewDataDisplayManager {
    
    public var dataSource: [CollectionViewCellViewModelConfigurable] = []

    public var didSelect: ((Int) -> Void)?
    
    public var willDisplay: ((Int) -> Void)?
    
    public var didScroll: ((CGFloat) -> Void)?
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        dataSource[indexPath.item].dequeueCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        dataSource[indexPath.item].sizeForItem(collectionView)
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelect?(indexPath.row)
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        willDisplay?(indexPath.row)
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didScroll?(scrollView.contentOffset.y)
    }
}
