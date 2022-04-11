//
//  TableReusableViewModelConfigurable.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public protocol TableReusableViewModelConfigurable {
    
    var configurator: TableReusableViewConfigurable { get }
    
    var height: CGFloat { get }

    func dequeueCell(tableView: UITableView) -> UITableViewHeaderFooterView
}

public extension TableReusableViewModelConfigurable {
    
    func dequeueCell(tableView: UITableView) -> UITableViewHeaderFooterView {
        configurator.configureView(tableView, viewModel: self)
    }
}
