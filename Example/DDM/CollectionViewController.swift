//
//  CollectionViewController.swift
//  DDM
//
//  Created by dev-lis on 04/11/2022.
//  Copyright (c) 2022 dev-lis. All rights reserved.
//

import UIKit
import DDM

class CollectionViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 4, left: 2, bottom: 4, right: 2)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = ddm
        collectionView.delegate = ddm
        collectionView.registerCell(type: ExampleCollectionViewCell.self)
        return collectionView
    }()
    
    private var viewModel: CollectionViewModel
    
    private let ddm: CollectionViewDataDisplayManager
    
    init(viewModel: CollectionViewModel,
         ddm: CollectionViewDataDisplayManager) {
        self.viewModel = viewModel
        self.ddm = ddm
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupUI()
        setupDDM()
        bindViewModel()
        viewModel.didLoadView()
    }
    
    func bindViewModel() {
        viewModel.reload = { [weak self] in
            self?.ddm.dataSource = $0
            self?.collectionView.reloadData()
        }
    }
    
    func setupUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupDDM() {
        ddm.didSelect = { [weak self] in
            self?.viewModel.didSelectItem(at: $0)
        }
    }
}

