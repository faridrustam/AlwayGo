//
//  SalesCell.swift
//  AlwayGo
//
//  Created by Mac on 07.03.25.
//

import UIKit

class SalesCell: UICollectionViewCell {

    private lazy var salesImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
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
        contentView.addSubview(salesImage)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            salesImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            salesImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            salesImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            salesImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func configureImage(image: String) {
        salesImage.image = UIImage(named: image)
    }
}
