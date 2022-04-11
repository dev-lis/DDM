//
//  UICollectionView+Extensions.swift
//  UIComponentsSDK
//
//  Created by Aleksandr Lis on 04/11/2022.
//  Copyright © 2021 DDM. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(type: T.Type) {
        register(type.self, forCellWithReuseIdentifier: type.className)
    }

    func registerCells<T: UICollectionViewCell>(types: [T.Type]) {
        types.forEach { registerCell(type: $0) }
    }
    
    func registerView<T: UICollectionReusableView>(type: T.Type, of kind: String) {
        register(type.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.className)
    }
    
    func registerViews<T: UICollectionReusableView>(types: [T.Type], of kind: String) {
        types.forEach { registerView(type: $0, of: kind) }
    }
    
    func dequeueCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type, of kind: String, for indexPath: IndexPath) -> T {
        dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.className, for: indexPath) as! T
    }
}
