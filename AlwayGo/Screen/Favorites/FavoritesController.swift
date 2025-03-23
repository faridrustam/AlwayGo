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
        layout.minimumLineSpacing = 2
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(FavoritesCell.self, forCellWithReuseIdentifier: "\(FavoritesCell.self)")
        collection.register(BoardsCell.self, forCellWithReuseIdentifier: "\(BoardsCell.self)")
        return collection
    }()
    
    let viewModel = FavoritesViewModel()
    let images = [UIImage(named: "Men"), UIImage(named: "Women"), UIImage(named: "Shoes")].compactMap { $0 }
    var isSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        configureButtons()
        view.backgroundColor = .white
        collection.backgroundColor = .systemGray6
        navigationItem.title = "FAVORITES"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "PlusJakartaSans-Semibold", size: 16) ?? "",
                                                                   .foregroundColor: UIColor.black]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftMagnifier"), style: .plain, target: self, action: #selector(rightBarbuttonTapped))
    }
    
    override func configureConstraints() {
        [favoritesHeader, itemsView, collection].forEach({ view.addSubview($0) })
        NSLayoutConstraint.activate([
            favoritesHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoritesHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favoritesHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favoritesHeader.heightAnchor.constraint(equalToConstant: 48),
            
            itemsView.topAnchor.constraint(equalTo: favoritesHeader.bottomAnchor, constant: 4),
            itemsView.leadingAnchor.constraint(equalTo: favoritesHeader.leadingAnchor),
            itemsView.trailingAnchor.constraint(equalTo: favoritesHeader.trailingAnchor),
            itemsView.heightAnchor.constraint(equalToConstant: 44),
            
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        //if itemsView.isHidden {
        //    collection.topAnchor.constraint(equalTo: favoritesHeader.bottomAnchor, constant: 4).isActive = true
        //} else {
            collection.topAnchor.constraint(equalTo: itemsView.bottomAnchor).isActive = true
        //}
    }
    
    @objc func rightBarbuttonTapped() {
    }
    
    func configureButtons() {
        favoritesHeader.allItemsSelected = { [weak self] selected in
            guard let self else { return }
            isSelected = selected
            itemsView.isHidden = false
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftMagnifier"), style: .plain, target: self, action: #selector(self.rightBarbuttonTapped))
            //configureConstraints()
            collection.reloadData()
        }
        
        favoritesHeader.boardsSelected = { [weak self] selected in
            guard let self else { return }
            isSelected = selected
            itemsView.isHidden = true
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Pluse"), style: .plain, target: self, action: #selector(self.rightBarbuttonTapped))
            //configureConstraints()
            collection.reloadData()
        }
    }
}

extension FavoritesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSelected ? 1 : 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isSelected {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(BoardsCell.self)", for: indexPath) as! BoardsCell
            cell.configure(with: images)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FavoritesCell.self)", for: indexPath) as! FavoritesCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isSelected {
            return .init(width: 334, height: 258)
        } else {
            return .init(width: collectionView.frame.width, height: 191)
        }
    }
}
