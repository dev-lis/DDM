//
//  CollectionViewCellViewModelConfigurable.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public protocol CollectionViewCellViewModelConfigurable {

    var configurator: CollectionViewCellConfigurable { get }
    
    func dequeueCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell

    func sizeForItem(_ collectionView: UICollectionView) -> CGSize
}

public extension CollectionViewCellViewModelConfigurable {
    
    func dequeueCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        configurator.configure(cell: collectionView, indexPath: indexPath, viewModel: self)
    }
}
