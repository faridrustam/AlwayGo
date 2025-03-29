//
//  ClothesCollection.swift
//  AlwayGo
//
//  Created by Mac on 08.03.25.
//

import UIKit

class ClothesCollectionCell: UICollectionViewCell {
    var handleSeeMoreButton: (() -> Void)?
    var handleCellSelection: (() -> Void)?
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Medium", size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("See more", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-SemiBold", size: 12)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    @objc func buttonTapped() {
        handleSeeMoreButton?()
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        collection.backgroundColor = .white
        [cellLabel, seeMoreButton, collection].forEach({ contentView.addSubview($0) })
        collection.delegate = self
        collection.dataSource = self
        collection.register(ClothesCell.self, forCellWithReuseIdentifier: "\(ClothesCell.self)")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            seeMoreButton.centerYAnchor.constraint(equalTo: cellLabel.centerYAnchor),
            seeMoreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            collection.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 16),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func configureCell(with text: String) {
        cellLabel.text = text
    }
}

extension ClothesCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCell.self)", for: indexPath) as! ClothesCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleCellSelection?()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 163, height: 284)
    }
}
