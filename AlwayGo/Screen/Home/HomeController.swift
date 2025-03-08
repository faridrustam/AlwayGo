//
//  ViewController.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 07.03.25.
//

import UIKit

class HomeController: BaseController {
    
    //MARK: UI Elements
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 24
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.addSubview(collection)
        view.backgroundColor = .systemBackground
        collection.delegate = self
        collection.dataSource = self
        cellRegister()
        
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func cellRegister() {
        collection.register(SalesCollectionCell.self,
                            forCellWithReuseIdentifier: "\(SalesCollectionCell.self)")
        collection.register(CategoryCollectionCell.self,
                            forCellWithReuseIdentifier: "\(CategoryCollectionCell.self)")
        collection.register(ClothesCollectionCell.self,
                            forCellWithReuseIdentifier: "\(ClothesCollectionCell.self)")
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
        case .sales:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SalesCollectionCell.self)", for: indexPath) as! SalesCollectionCell
            return cell
        case .categories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryCollectionCell.self)", for: indexPath) as! CategoryCollectionCell
            return cell
        case .forYou:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)", for: indexPath) as! ClothesCollectionCell
            return cell
        case .recentlyViewed:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)", for: indexPath) as! ClothesCollectionCell
            return cell
        case .trendingNow:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)", for: indexPath) as! ClothesCollectionCell
            return cell
        case .bestDealsDiscounts:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCollectionCell.self)", for: indexPath) as! ClothesCollectionCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellType = viewModel.cellTypes[indexPath.item]
        
        switch cellType {
        case .sales:
            return .init(width: collectionView.frame.width, height: 132)
        case .categories:
            return .init(width: collectionView.frame.width, height: 212)
        case .forYou:
            return .init(width: collectionView.frame.width, height: 324)
        case .recentlyViewed:
            return .init(width: collectionView.frame.width, height: 324)
        case .trendingNow:
            return .init(width: collectionView.frame.width, height: 324)
        case .bestDealsDiscounts:
            return .init(width: collectionView.frame.width, height: 324)
        }
        
    }
}
