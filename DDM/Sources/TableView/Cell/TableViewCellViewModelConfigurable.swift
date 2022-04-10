//
//  TableViewCellViewModelConfigurable.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public protocol TableViewCellViewModelConfigurable {

    var configurator: TableViewCellConfigurable { get }

    func dequeueCell(tableView: UITableView) -> UITableViewCell
}

public extension TableViewCellViewModelConfigurable {
    
    func dequeueCell(tableView: UITableView) -> UITableViewCell {
        configurator.configure(cell: tableView, viewModel: self)
    }
}
