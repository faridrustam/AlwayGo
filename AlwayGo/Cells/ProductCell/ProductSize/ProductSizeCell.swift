//
//  ProductSizeCell.swift
//  AlwayGo
//
//  Created by Mac on 22.03.25.
//

import UIKit

class ProductSizeCell: UITableViewCell {
    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Size: Choose size"
        label.font = .customFont(.sfProRegular, size: 16)
        label.textColor = .black
        let attributes = NSMutableAttributedString(string: label.text ?? "")
        attributes.addAttribute(.font, value: UIFont.customFont(.sfProMedium, size: 16),
                                range: .init(location: 6, length: 11))
        label.attributedText = attributes
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sizingHelpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sizing help?"
        label.font = .customFont(.sfProRegular, size: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        let attributes = NSMutableAttributedString(string: label.text ?? "",
                                                   attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.attributedText = attributes
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(ProductSizeCollectionCell.self,
                            forCellWithReuseIdentifier: "\(ProductSizeCollectionCell.self)")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    var size = [Value]()
    var selectedCell: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureArray(with array: [Value]) {
        size = array
        collection.reloadData()
        print(size)
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        contentView.addSubViews(sizeLabel, sizingHelpLabel, collection)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            sizeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sizeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            sizingHelpLabel.centerYAnchor.constraint(equalTo: sizeLabel.centerYAnchor),
            sizingHelpLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            collection.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 16),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}

extension ProductSizeCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return size.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProductSizeCollectionCell.self)",
                                                      for: indexPath) as! ProductSizeCollectionCell
        cell.configureCell(with: size[indexPath.row].value ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell?()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 84, height: 40)
    }
}
