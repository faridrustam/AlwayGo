//
//  CategoryCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 08.03.25.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Medium", size: 18)
        label.textColor = .label
        label.text = "Man"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "man")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        addSubview(categoryLabel)
        addSubview(categoryImageView)
        
        NSLayoutConstraint.activate([
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImageView.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: -8)
        ])
    }
    
    func configure(text: String) {
        categoryImageView.image = UIImage(named: text)
        categoryLabel.text = text
    }
}
