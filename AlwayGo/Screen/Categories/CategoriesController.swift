//
//  CategoriesController.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class CategoriesController: BaseController {
    let cellData = ["Sale", "Woman", "Men", "Face & Body", "Home", "Kid", "Outdoor", "Accessories", "Technology"]
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 4
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "CATEGORIES"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "PlusJakartaSans-Semibold", size: 16) ?? "",
                                                                   .foregroundColor: UIColor.black]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftMagnifier"), style: .plain, target: self, action: #selector(magnifierButtonTapped))
        view.addSubview(collection)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CategoryControllerCell.self, forCellWithReuseIdentifier: "\(CategoryControllerCell.self)")
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc func magnifierButtonTapped() {
        
    }
}

extension CategoriesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryControllerCell.self)", for: indexPath) as! CategoryControllerCell
        cell.configureCell(name: cellData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 120)
    }
}
