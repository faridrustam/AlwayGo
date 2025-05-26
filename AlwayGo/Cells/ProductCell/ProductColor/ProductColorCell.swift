//
//  ProductColorCell.swift
//  AlwayGo
//
//  Created by Mac on 22.03.25.
//

import UIKit

class ProductColorCell: UITableViewCell {
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "Color:"
        label.font = .customFont(.sfProRegular, size: 16)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var colorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .customFont(.sfProMedium, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(ProductColorCollectionCell.self, forCellWithReuseIdentifier: "\(ProductColorCollectionCell.self)")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private var images: [Value] = []
    var selectedCell: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        contentView.addSubViews(colorLabel, colorNameLabel, collection)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            colorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            colorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            colorNameLabel.leadingAnchor.constraint(equalTo: colorLabel.trailingAnchor, constant: 4),
            colorNameLabel.centerYAnchor.constraint(equalTo: colorLabel.centerYAnchor),
            
            collection.heightAnchor.constraint(equalToConstant: 88),
            collection.leadingAnchor.constraint(equalTo: colorLabel.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            collection.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 16)
        ])
    }
    
    func configureCell(with colorName: String, and value: [Value]) {
        colorNameLabel.text = colorName
        self.images = value
        collection.reloadData()
    }
}

extension ProductColorCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProductColorCollectionCell.self)",
                                                      for: indexPath) as! ProductColorCollectionCell
        cell.configureCell(with: images[indexPath.row].value ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell?()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 68, height: 88)
    }
}
