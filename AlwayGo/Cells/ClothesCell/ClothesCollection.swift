//
//  ClothesCollection.swift
//  AlwayGo
//
//  Created by Mac on 08.03.25.
//

import UIKit

class ClothesCollection: UICollectionViewCell {
    private lazy var forYouLabel: UILabel = {
        let label = UILabel()
        label.text = "For you"
        label.font = UIFont(name: "SFProText-Medium", size: 20)
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("See more", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 12)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        [forYouLabel, seeMoreButton, collection].forEach({ contentView.addSubview($0) })
        collection.delegate = self
        collection.dataSource = self
        collection.register(ClothesCell.self, forCellWithReuseIdentifier: "\(ClothesCell.self)")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            forYouLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            forYouLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            seeMoreButton.centerYAnchor.constraint(equalTo: forYouLabel.centerYAnchor),
            seeMoreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            collection.topAnchor.constraint(equalTo: forYouLabel.bottomAnchor, constant: 16),
            collection.leadingAnchor.constraint(equalTo: forYouLabel.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension ClothesCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCell.self)", for: indexPath) as! ClothesCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 163, height: 324)
    }
}
