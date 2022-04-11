//
//  CollectionViewCellConfigurable.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public protocol CollectionViewCellConfigurable {

    func configure(cell collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionViewCellViewModelConfigurable) -> UICollectionViewCell
}
