//
//  ExampleCollectionViewCellViewModelTest.swift
//  DDM_ExampleTests
//
//  Created by Aleksandr Lis on 11.04.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
@testable import DDM_Example
import DDM

class ExampleCollectionViewCellViewModelTest: XCTestCase {
    
    private var cell: ExampleCollectionViewCellMock!
    
    override func setUp() {
        super.setUp()
        
        cell = ExampleCollectionViewCellMock()
    }
    
    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    
    func test_setTitle() {
        let testTitle = "test"
        let viewModel = ExampleCollectionViewCellViewModelImpl(title: testTitle)

        cell.configure(viewModel)

        XCTAssertEqual(cell.title, testTitle)
    }
}

class ExampleCollectionViewCellMock: UICollectionViewCell, Configurable {

    var title: String = ""

    var viewModel: ExampleCollectionViewCellViewModel?

    func setupUI() {
        viewModel?.didLoadCell()
    }

    func bindUI() {
        viewModel?.setTitle = { [weak self] in
            self?.title = $0

        }
    }
}
