# DDM

[![Platforms](https://img.shields.io/badge/Platforms-iOS-blue?style=flat-square)](https://developer.apple.com/macOS)
[![iOS](https://img.shields.io/badge/iOS-12.0-blue.svg)](https://developer.apple.com/iOS)
[![Version](https://img.shields.io/cocoapods/v/DDM.svg?style=flat)](https://cocoapods.org/pods/DDM)
[![License](https://img.shields.io/badge/licenses-MIT-red.svg)](https://opensource.org/licenses/MIT)

## Installation

DDM is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DDM', '~> 0.1.0'
```

## Usages
At first for use Data Display Manager you should create cell module.

Create ViewModel protocol and add there interfaces for binding with cell. By the way you can use Rx or any other reactive binding instead callback.
```swift
import DDM

protocol ExampleCollectionViewCellViewModel: CollectionViewCellViewModelConfigurable {
    
    var setTitle: ((String) -> Void)? { get set }
    
    func didLoadCell()
}
```

Next step create ViewModel. Here your should implement `CollectionViewCellViewModelConfigurable` & `ExampleCollectionViewCellViewModel`. CollectionViewCellConfigurable is generic object, witch configure Cell with ViewModel.
```swift
import DDM

typealias ExampleCollectionViewCellConfigurator = CollectionViewCellConfigurator<ExampleCollectionViewCell, ExampleCollectionViewCellViewModel>

struct ExampleCollectionViewCellViewModelImpl: ExampleCollectionViewCellViewModel {
    
    var configurator: CollectionViewCellConfigurable = ExampleCollectionViewCellConfigurator()
    
    var setTitle: ((String) -> Void)?
    
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func didLoadCell() {
        setTitle?(title)
    }
    
    func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let size = (collectionView.frame.width - layout.sectionInset.left - layout.sectionInset.right - layout.minimumInteritemSpacing * 2) / 3
        return CGSize(width: size, height: size)
    }
}
```

And finale step crete cell and subscribe in on `Configurable` protocol. You should implement viewModel property with type of your own ViewModel protocol. Also you have two methods: 
1. for setup yout custom UI 
2. for binding ViewModel bunging
```swift
import UIKit
import DDM

class ExampleCollectionViewCell: UICollectionViewCell, Configurable {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    var viewModel: ExampleCollectionViewCellViewModel?
    
    func bindUI() {
        viewModel?.setTitle = { [weak self] in
            self?.titleLabel.text = $0
            
        }
    }
    
    func setupUI() {
        viewModel?.didLoadCell()
        
        backgroundColor = .systemRed
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
```

Now fill dataSource array with ViewModel objects.
```swift
    var dataSource: [CollectionViewCellViewModelConfigurable] = []
    
    for i in 1..<100 {
        let viewModel = ExampleCollectionViewCellViewModelImpl(title: "Example cell \(i)")
        dataSource.append(viewModel)
    }
```

Create Data Display Manager object and set it `dataSource` & `delegate` for collectionView. Handle callback ddm events from `UICollectionViewDelegate`.
```swift
    let ddm: CollectionViewDataDisplayManager = CollectionViewDataDisplayManagerImpl()
    ddm.dataSource = dataSource
    
    collectionView.dataSource = ddm
    collectionView.delegate = ddm
        
    ddm.didSelect = { [weak self] index in
        // handle tap on cell
    }
``` 

## Author

dev-lis, mr.aleksandr.lis@gmail.com

## License

DDM is available under the MIT license. See the LICENSE file for more info.
