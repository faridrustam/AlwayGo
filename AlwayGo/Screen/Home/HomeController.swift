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
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.addSubview(collection)
        view.backgroundColor = .systemBackground
        collection.delegate = self
        collection.dataSource = self
        collection.register(SalesCollectionCell.self, forCellWithReuseIdentifier: "\(SalesCollectionCell.self)")
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func configureviewModel() {
        print("")
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SalesCollectionCell.self)",
                                                      for: indexPath) as! SalesCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 132)
    }
}

