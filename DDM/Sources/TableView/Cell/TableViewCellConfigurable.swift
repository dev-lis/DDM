//
//  TableViewCellConfigurable.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public protocol TableViewCellConfigurable {

    func configure(cell tableView: UITableView, viewModel: TableViewCellViewModelConfigurable) -> UITableViewCell
}
