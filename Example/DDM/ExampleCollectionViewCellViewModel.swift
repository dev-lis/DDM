//
//  ExampleCollectionViewCellViewModel.swift
//  DDM_Example
//
//  Created by Aleksandr Lis on 11.04.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import DDM

protocol ExampleCollectionViewCellViewModel: CollectionViewCellViewModelConfigurable {
    
    var setTitle: ((String) -> Void)? { get set }
    
    func didLoadCell()
}
