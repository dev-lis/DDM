//
//  TableReusableViewConfigurable.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public protocol TableReusableViewConfigurable {
    
    func configureView(_ tableView: UITableView, viewModel: TableReusableViewModelConfigurable) -> UITableViewHeaderFooterView
}
