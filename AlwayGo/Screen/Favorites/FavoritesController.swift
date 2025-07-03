//
//  FavoritesController.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class FavoritesController: BaseController {
    
    private lazy var refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshStarted), for: .valueChanged)
        return refresh
    }()
    
    private lazy var itemsView: ItemsView = {
        let view = ItemsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(FavoritesCell.self, forCellWithReuseIdentifier: "\(FavoritesCell.self)")
        collection.register(BoardsCell.self, forCellWithReuseIdentifier: "\(BoardsCell.self)")
        return collection
    }()
    
    private let viewModel = FavoritesViewModel()
    private let images = [UIImage(named: "Men"), UIImage(named: "Women"), UIImage(named: "Shoes")].compactMap { $0 }
    private var collectionTopConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.backgroundColor = .white
        collection.backgroundColor = .systemGray6
        collection.refreshControl = refresh
        navigationItem.title = "FAVORITES"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.customFont(.sfProSemibold, size: 16),
                                                                   .foregroundColor: UIColor.black]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftMagnifier"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(rightBarbuttonTapped))
        let url = FileManagerHelper.shared.readFilePath()
        print(url)
    }
    
    override func configureConstraints() {
        view.addSubViews(itemsView, collection)
        NSLayoutConstraint.activate([
            itemsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            itemsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            itemsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            itemsView.heightAnchor.constraint(equalToConstant: 44),
            
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        collectionTopConstraint = collection.topAnchor.constraint(equalTo: itemsView.bottomAnchor)
        collectionTopConstraint?.isActive = true
    }
    
    override func configureViewModel() {
        itemsView.addProduct(product: viewModel.product)
        viewModel.addProductData()
    }
    
    private func updateCollectionTopConstraint() {
        collectionTopConstraint?.isActive = false
        collectionTopConstraint?.isActive = true
        collection.reloadData()
    }
    
    @objc private func refreshStarted() {
        viewModel.refreshData()
        collection.reloadData()
        refresh.endRefreshing()
    }
    
    @objc private func rightBarbuttonTapped() {
        
    }
}

extension FavoritesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FavoritesCell.self)",
                                                      for: indexPath) as! FavoritesCell
        
        cell.addProduct(with: viewModel.product[indexPath.row])
        cell.product = viewModel.product[indexPath.row]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 191)
    }
}
