//
//  CollectionViewModel.swift
//  DDM_Example
//
//  Created by Aleksandr Lis on 11.04.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import DDM

protocol CollectionViewModel {
    
    var reload: (([CollectionViewCellViewModelConfigurable]) -> Void)? { get set }
    
    func didLoadView()
    
    func didSelectItem(at index: Int)
}

class CollectionViewModelImpl: CollectionViewModel {
    
    var reload: (([CollectionViewCellViewModelConfigurable]) -> Void)?
    
    private var dataSource: [CollectionViewCellViewModelConfigurable] = []
    
    func didLoadView() {
        setupDataSource()
        reload?(dataSource)
    }
    
    func didSelectItem(at index: Int) {
        print("did tap cell at \(index)")
    }
    
    private func setupDataSource() {
        for i in 1..<100 {
            let viewModel = ExampleCollectionViewCellViewModelImpl(title: "Example cell \(i)")
            dataSource.append(viewModel)
        }
    }
}
