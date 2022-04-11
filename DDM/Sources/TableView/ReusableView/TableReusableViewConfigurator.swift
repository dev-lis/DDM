//
//  TableReusableViewConfigurator.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public struct TableReusableViewConfigurator<ViewType: Configurable, ViewModel>: TableReusableViewConfigurable where ViewType.ViewModel == ViewModel, ViewType: UITableViewHeaderFooterView {
    
    public init() {}
    
    public func configureView(_ tableView: UITableView, viewModel: TableReusableViewModelConfigurable) -> UITableViewHeaderFooterView {
        var view = tableView.dequeueView(with: ViewType.self)
        view.configure(viewModel as? ViewModel)
        return view
    }
}
