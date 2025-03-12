//
//  HeaderCollectionCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 08.03.25.
//

import UIKit

class HeaderCollectionCell: UICollectionViewCell {
    
    private lazy var collection: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumInteritemSpacing = 8
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(HeaderCell.self, forCellWithReuseIdentifier: "\(HeaderCell.self)")
        return collection
    }()
    
    let headerTitles: [String] = ["Woman", "Man", "Kids", "Accessories"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        collection.backgroundColor = .systemBackground
        collection.delegate = self
        collection.dataSource = self
        
        if let flowLayout = collection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    private func configureConstraints() {
        contentView.addSubview(collection)
        
        NSLayoutConstraint.activate([
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collection.topAnchor.constraint(equalTo: contentView.topAnchor),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

extension HeaderCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        headerTitles.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HeaderCell.self)", for: indexPath) as! HeaderCell
            cell.configure(text: "All Categories", hideIcon: false)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HeaderCell.self)", for: indexPath) as! HeaderCell
        cell.configure(text: headerTitles[indexPath.item - 1], hideIcon: true)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 61, height: 32)
    }
}
