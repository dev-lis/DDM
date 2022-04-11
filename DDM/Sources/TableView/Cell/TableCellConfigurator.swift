//
//  TableCellConfigurator.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public struct TableViewCellConfigurator<CellType: Configurable, ViewModel>: TableViewCellConfigurable where CellType.ViewModel == ViewModel, CellType: UITableViewCell {
    
    public init() {}

    public func configure(cell tableView: UITableView, viewModel: TableViewCellViewModelConfigurable) -> UITableViewCell {
        var cell = tableView.dequeueCell(with: CellType.self)
        cell.configure(viewModel as? ViewModel)
        return cell
    }
}
