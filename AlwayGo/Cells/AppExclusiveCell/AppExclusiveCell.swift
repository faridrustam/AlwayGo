//
//  AppExclusiveCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 09.03.25.
//

import UIKit

class AppExclusiveCell: UICollectionViewCell {
    
    private lazy var backImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "appExclusive")
        imageView.layer.cornerRadius = 8
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
        contentView.addSubview(backImage)
        
        NSLayoutConstraint.activate([
            backImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            backImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
    }
    
    func configure() {
    }
}
