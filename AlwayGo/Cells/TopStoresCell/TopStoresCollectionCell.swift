//
//  TopStoresCollectionCell.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class TopStoresCollectionCell: UICollectionViewCell {
    var cellImages = ["zaraLogo",
                      "bershkaLogo",
                      "maviLogo",
                      "aldoLogo",
                      "newBalanceLogo"]
    
    private lazy var topStoresLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Stores"
        label.font = .customFont(.sfProMedium, size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(TopStoresCell.self, forCellWithReuseIdentifier: "\(TopStoresCell.self)")
        contentView.addSubViews(topStoresLabel, collection)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            topStoresLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            topStoresLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            collection.topAnchor.constraint(equalTo: topStoresLabel.bottomAnchor, constant: 16),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension TopStoresCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopStoresCell.self)",
                                                      for: indexPath) as! TopStoresCell
        cell.configCell(image: cellImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 72, height: 72)
    }
}
