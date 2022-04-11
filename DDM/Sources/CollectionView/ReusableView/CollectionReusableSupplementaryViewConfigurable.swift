//
//  CollectionReusableSupplementaryViewConfigurable.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public protocol CollectionReusableSupplementaryViewConfigurable {
    
    func configureHeader(_ collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView
    
    func configureFooter(_ collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView
}
