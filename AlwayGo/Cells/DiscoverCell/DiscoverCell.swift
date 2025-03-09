//
//  DiscoverCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 09.03.25.
//

import UIKit

class DiscoverCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Medium", size: 20)
        label.textColor = .white
        label.text = "New Season"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var discoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "discover")
        imageView.layer.cornerRadius = 12
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
        addSubview(discoverImageView)
        discoverImageView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            discoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            discoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            discoverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            discoverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(text: String) {
        discoverImageView.image = UIImage(named: text)
        titleLabel.text = text
    }
}

