//
//  ExampleCollectionViewCell.swift
//  DDM_Example
//
//  Created by Aleksandr Lis on 11.04.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import DDM

class ExampleCollectionViewCell: UICollectionViewCell, Configurable {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    var viewModel: ExampleCollectionViewCellViewModel?
    
    func bindUI() {
        viewModel?.setTitle = { [weak self] in
            self?.titleLabel.text = $0
            
        }
    }
    
    func setupUI() {
        viewModel?.didLoadCell()
        
        backgroundColor = .systemRed
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
