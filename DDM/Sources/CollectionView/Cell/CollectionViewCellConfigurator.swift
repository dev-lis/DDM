//
//  CollectionViewCellConfigurator.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public struct CollectionViewCellConfigurator<CellType: Configurable, ViewModel>: CollectionViewCellConfigurable where CellType.ViewModel == ViewModel, CellType: UICollectionViewCell {
    
    public init() {}
    
    public func configure(cell collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionViewCellViewModelConfigurable) -> UICollectionViewCell {
        var cell = collectionView.dequeueCell(with: CellType.self, for: indexPath)
        cell.configure(viewModel as? ViewModel)
        return cell
    }
}

