//
//  ViewController.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 07.03.25.
//

import UIKit

class HomeController: BaseController {
    
    //MARK: UI Elements
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Magnifier")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        let attributedString = NSAttributedString(string: "Search",
                                                  attributes: [NSAttributedString.Key.font: UIFont.customFont(.sfProSemibold, size: 16)])
        let attributedString2 = NSAttributedString(string: "Search",
                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        textField.attributedPlaceholder = attributedString
        textField.attributedPlaceholder = attributedString2
        textField.textColor = .darkGray
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 14
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let viewModel = HomeViewModel()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.isHidden = true
        view.addSubViews(searchView, collection)
        searchView.addSubViews(searchImage, searchTextField)
        view.backgroundColor = .white
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        registerCell()
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            searchView.widthAnchor.constraint(equalToConstant: 370),
            searchView.heightAnchor.constraint(equalToConstant: 48),
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            searchImage.widthAnchor.constraint(equalToConstant: 24),
            searchImage.heightAnchor.constraint(equalToConstant: 24),
            searchImage.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 12),
            searchImage.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 24),
            
            searchTextField.centerYAnchor.constraint(equalTo: searchImage.centerYAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: searchImage.trailingAnchor, constant: 12),
            searchTextField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -12),
            
            collection.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 16),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func registerCell() {
        collection.register(SalesCollectionCell.self,
                            forCellWithReuseIdentifier: "\(SalesCollectionCell.self)")
        collection.register(CategoryCollectionCell.self,
                            forCellWithReuseIdentifier: "\(CategoryCollectionCell.self)")
        collection.register(ClothesCollectionCell.self,
                            forCellWithReuseIdentifier: "\(ClothesCollectionCell.self)")
        collection.register(TopStoresCollectionCell.self,
                            forCellWithReuseIdentifier: "\(TopStoresCollectionCell.self)")
        collection.register(AppExclusiveCollectionCell.self,
                            forCellWithReuseIdentifier: "\(AppExclusiveCollectionCell.self)")
        collection.register(DiscoverCell.self,
                            forCellWithReuseIdentifier: "\(DiscoverCell.self)")
        collection.register(HeaderCollectionCell.self,
                            forCellWithReuseIdentifier: "\(HeaderCollectionCell.self)")
        collection.register(LabelCell.self,
                            forCellWithReuseIdentifier: "\(LabelCell.self)")
    }
    
    override func configureviewModel() {
        viewModel.getCategoryData()
        viewModel.success = { [weak self] in
            guard let self else { return }
            print("ProductItems count:", self.viewModel.productItems.count)
            for item in self.viewModel.productItems {
                print("Title: \(item.title ?? "No Title"), Products: \(item.items?.count ?? 0)")
            }
            if let email = KeychainManager.shared.getSavedEmailAccount() {
                                if let token = KeychainManager.shared.readToken(account: email) {
                                    print("Retrieved token: \(token)")
                                } else {
                                    print("Token not found for account: \(email)")
                                }
                            } else {
                                print("No saved email account found in Keychain.")
                            }
            collection.reloadData()
        }
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = viewModel.cellTypes[indexPath.item]
        
        
        switch cellType {
        case .sales:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SalesCollectionCell.self)",
                                                          for: indexPath) as! SalesCollectionCell
            return cell
            
        case .forYou:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)",
                                                          for: indexPath) as! ClothesCollectionCell
            if viewModel.productItems.indices.contains(0) {
                let productType = viewModel.productItems[0]
                cell.configureCell(with: productType.title ?? "No Title", product: productType.items)
                cell.handleCellSelection = { [weak self] in
                    guard let self else { return }
                    let coordinator = ProductCoordinator(navigationController: navigationController ?? UINavigationController(),
                                                         id: productType.items?[0].id ?? "",
                                                         price: productType.items?[0].variants?[0].price ?? 0)
                    coordinator.start()
                }
            }
            return cell
            
        case .recentlyViewed:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)",
                                                          for: indexPath) as! ClothesCollectionCell
            if viewModel.productItems.indices.contains(1) {
                let productType = viewModel.productItems[1]
                cell.configureCell(with: productType.title ?? "No Title", product: productType.items)
                cell.handleCellSelection = { [weak self] in
                    guard let self else { return }
                    let coordinator = ProductCoordinator(navigationController: navigationController ?? UINavigationController(),
                                                         id: productType.items?[1].id ?? "",
                                                         price: productType.items?[1].variants?[1].price ?? 0)
                    coordinator.start()
                }
            }
            return cell
            
        case .trendingNow:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)",
                                                          for: indexPath) as! ClothesCollectionCell
            if viewModel.productItems.indices.contains(2) {
                let productType = viewModel.productItems[2]
                cell.configureCell(with: productType.title ?? "No Title", product: productType.items)
                cell.handleCellSelection = { [weak self] in
                    guard let self else { return }
                    let coordinator = ProductCoordinator(navigationController: navigationController ?? UINavigationController(),
                                                         id: productType.items?[2].id ?? "",
                                                         price: productType.items?[2].variants?[2].price ?? 0)
                    coordinator.start()
                }
            }
            return cell
            
        case .appExclusive:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AppExclusiveCollectionCell.self)",
                                                          for: indexPath) as! AppExclusiveCollectionCell
            return cell
            
        case .topStores:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopStoresCollectionCell.self)",
                                                          for: indexPath) as! TopStoresCollectionCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellType = viewModel.cellTypes[indexPath.item]
        
        switch cellType {
        case .sales:
            return .init(width: collectionView.frame.width, height: 132)
        case .forYou, .trendingNow, .recentlyViewed:
            return .init(width: collectionView.frame.width, height: 340)
        case .appExclusive:
            return .init(width: collectionView.frame.width, height: 95)
        case .topStores:
            return .init(width: collectionView.frame.width, height: 130)
        }
    }
}

extension HomeController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
