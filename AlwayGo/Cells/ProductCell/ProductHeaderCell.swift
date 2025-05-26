//
//  ProductHeaderCell.swift
//  AlwayGo
//
//  Created by Mac on 18.03.25.
//

import UIKit

class ProductHeaderCell: UICollectionViewCell {
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        contentView.addSubview(productImage)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            productImage.widthAnchor.constraint(equalToConstant: 370),
            productImage.heightAnchor.constraint(equalToConstant: 370)
        ])
    }
    
    func configureImage(with imageName: String) {
//        productImage.image = UIImage(named: imageName)
        productImage.setImage(with: imageName)
    }
}
