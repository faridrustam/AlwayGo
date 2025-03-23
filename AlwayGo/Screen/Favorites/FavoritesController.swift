//
//  FavoritesController.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class FavoritesController: BaseController {
    private lazy var favoritesHeader: FavoritesHeaderView = {
        let view = FavoritesHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var itemsView: ItemsView = {
        let view = ItemsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.backgroundColor = .white
        collection.backgroundColor = .white
        navigationItem.title = "FAVORITES"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "PlusJakartaSans-Semibold", size: 16) ?? "",
                                                                   .foregroundColor: UIColor.black]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftMagnifier"), style: .plain, target: self, action: #selector(magnifierButtonTapped))
        [favoritesHeader, itemsView, collection].forEach({ view.addSubview($0) })
        collection.delegate = self
        collection.dataSource = self
        collection.register(FavoritesCell.self, forCellWithReuseIdentifier: "\(FavoritesCell.self)")
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            favoritesHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoritesHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favoritesHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favoritesHeader.heightAnchor.constraint(equalToConstant: 48),
            
            itemsView.topAnchor.constraint(equalTo: favoritesHeader.bottomAnchor, constant: 4),
            itemsView.leadingAnchor.constraint(equalTo: favoritesHeader.leadingAnchor),
            itemsView.trailingAnchor.constraint(equalTo: favoritesHeader.trailingAnchor),
            itemsView.heightAnchor.constraint(equalToConstant: 44),
            
            collection.topAnchor.constraint(equalTo: itemsView.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc func magnifierButtonTapped() {
        
    }
}

extension FavoritesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FavoritesCell.self)", for: indexPath) as! FavoritesCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 191)
    }
}

#Preview {
    FavoritesController()
}
