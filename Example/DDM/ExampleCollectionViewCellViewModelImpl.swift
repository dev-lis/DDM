//
//  ExampleCollectionViewCellViewModelImpl.swift
//  DDM_Example
//
//  Created by Aleksandr Lis on 11.04.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import DDM

typealias ExampleCollectionViewCellConfigurator = CollectionViewCellConfigurator<ExampleCollectionViewCell, ExampleCollectionViewCellViewModel>

struct ExampleCollectionViewCellViewModelImpl: ExampleCollectionViewCellViewModel {
    
    var configurator: CollectionViewCellConfigurable = ExampleCollectionViewCellConfigurator()
    
    var setTitle: ((String) -> Void)?
    
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func didLoadCell() {
        setTitle?(title)
    }
    
    func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let size = (collectionView.frame.width - layout.sectionInset.left - layout.sectionInset.right - layout.minimumInteritemSpacing * 2) / 3
        return CGSize(width: size, height: size)
    }
}
