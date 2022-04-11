//
//  Configurable.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import Foundation

public protocol Configurable {

    associatedtype ViewModel

    var viewModel: ViewModel? { get set }

    func bindUI()

    func setupUI()

    mutating func configure(_ viewModel: ViewModel?)
}

public extension Configurable {
    mutating func configure(_ viewModel: ViewModel?) {
        self.viewModel = viewModel
        self.bindUI()
        self.setupUI()
    }
}
