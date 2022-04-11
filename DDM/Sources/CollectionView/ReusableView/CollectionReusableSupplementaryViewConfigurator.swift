//
//  CollectionReusableSupplementaryViewConfigurator.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public struct CollectionReusableSupplementaryViewConfigurator<ViewType: Configurable, ViewModel>: CollectionReusableSupplementaryViewConfigurable where ViewType.ViewModel == ViewModel, ViewType: UICollectionReusableView {
    
    public init() {}
    
    public func configureHeader(_ collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView {
        var view = collectionView.dequeueReusableView(with: ViewType.self, of: UICollectionView.elementKindSectionHeader, for: indexPath)
        view.configure(viewModel as? ViewModel)
        return view
    }
    
    public func configureFooter(_ collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView {
        var view = collectionView.dequeueReusableView(with: ViewType.self, of: UICollectionView.elementKindSectionFooter, for: indexPath)
        view.configure(viewModel as? ViewModel)
        return view
    }
}
