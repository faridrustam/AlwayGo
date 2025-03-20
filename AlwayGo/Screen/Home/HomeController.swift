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
        view.layer.borderWidth = 0.5
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var cameraImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Camera")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        [searchView, collection].forEach({ view.addSubview($0) })
        [searchImage, searchTextField, cameraImage].forEach({ searchView.addSubview($0) })
        view.backgroundColor = .white
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
            searchTextField.trailingAnchor.constraint(equalTo: cameraImage.leadingAnchor, constant: -12),
            
            cameraImage.widthAnchor.constraint(equalToConstant: 24),
            cameraImage.heightAnchor.constraint(equalToConstant: 24),
            cameraImage.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -24),
            cameraImage.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            
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
        print("")
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = viewModel.cellTypes[indexPath.item]
        
        switch cellType {
        case .header:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HeaderCollectionCell.self)",
                                                          for: indexPath) as! HeaderCollectionCell
            return cell
        case .sales:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SalesCollectionCell.self)",
                                                          for: indexPath) as! SalesCollectionCell
            return cell
            
        case .categories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryCollectionCell.self)",
                                                          for: indexPath) as! CategoryCollectionCell
            return cell
            
        case .forYou:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)",
                                                          for: indexPath) as! ClothesCollectionCell
            cell.handleSeeMoreButton = { [weak self] in
                guard let self else { return }
                let coordinator = SeeMoreCoordinator(navigationController: navigationController ?? UINavigationController())
                coordinator.start()
            }
            cell.handleCellSelection = { [weak self] in
                guard let self else { return }
                let coordinator = ProductCoordinator(navigationController: navigationController ?? UINavigationController())
                coordinator.start()
            }
            return cell
            
        case .appExclusive:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AppExclusiveCollectionCell.self)",
                                                          for: indexPath) as! AppExclusiveCollectionCell
            return cell
            
        case .recentlyViewed:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)",
                                                          for: indexPath) as! ClothesCollectionCell
            cell.handleSeeMoreButton = { [weak self] in
                guard let self else { return }
                let coordinator = SeeMoreCoordinator(navigationController: navigationController ?? UINavigationController())
                coordinator.start()
            }
            cell.handleCellSelection = { [weak self] in
                guard let self else { return }
                let coordinator = ProductCoordinator(navigationController: navigationController ?? UINavigationController())
                coordinator.start()
            }
            return cell
            
        case .topStores:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopStoresCollectionCell.self)",
                                                          for: indexPath) as! TopStoresCollectionCell
            return cell
            
        case .trendingNow:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)",
                                                          for: indexPath) as! ClothesCollectionCell
            cell.handleSeeMoreButton = { [weak self] in
                guard let self else { return }
                let coordinator = SeeMoreCoordinator(navigationController: navigationController ?? UINavigationController())
                coordinator.start()
            }
            cell.handleCellSelection = { [weak self] in
                guard let self else { return }
                let coordinator = ProductCoordinator(navigationController: navigationController ?? UINavigationController())
                coordinator.start()
            }
            return cell
            
        case .bestDealsDiscounts:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)",
                                                          for: indexPath) as! ClothesCollectionCell
            cell.handleSeeMoreButton = { [weak self] in
                guard let self else { return }
                let coordinator = SeeMoreCoordinator(navigationController: navigationController ?? UINavigationController())
                coordinator.start()
            }
            cell.handleCellSelection = { [weak self] in
                guard let self else { return }
                let coordinator = ProductCoordinator(navigationController: navigationController ?? UINavigationController())
                coordinator.start()
            }
            return cell
            
        case .typeLabel:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(LabelCell.self)",
                                                          for: indexPath) as! LabelCell
            return cell
            
        case .newSeason:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DiscoverCell.self)",
                                                          for: indexPath) as! DiscoverCell
            cell.configure(text: "New season")
            return cell
            
        case .arriveIn:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DiscoverCell.self)",
                                                          for: indexPath) as! DiscoverCell
            cell.configure(text: "Just arrive in")
            return cell
            
        case .home:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DiscoverCell.self)",
                                                          for: indexPath) as! DiscoverCell
            cell.configure(text: "Home")
            return cell
            
        case .kids:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DiscoverCell.self)",
                                                          for: indexPath) as! DiscoverCell
            cell.configure(text: "Kids")
            return cell
            
        case .denimFits:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DiscoverCell.self)",
                                                          for: indexPath) as! DiscoverCell
            cell.configure(text: "Denim fits")
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellType = viewModel.cellTypes[indexPath.item]
        
        switch cellType {
        case .header:
            return .init(width: collectionView.frame.width, height: 50)
        case .sales:
            return .init(width: collectionView.frame.width, height: 132)
        case .categories:
            return .init(width: collectionView.frame.width, height: 212)
        case .forYou, .bestDealsDiscounts, .trendingNow, .recentlyViewed:
            return .init(width: collectionView.frame.width, height: 340)
        case .appExclusive:
            return .init(width: collectionView.frame.width, height: 95)
        case .topStores:
            return .init(width: collectionView.frame.width, height: 130)
        case .typeLabel:
            return .init(width: collectionView.frame.width, height: 30)
        case .newSeason, .arriveIn, .home, .kids, .denimFits:
            return .init(width: collectionView.frame.width, height: 270)
        }
    }
}
