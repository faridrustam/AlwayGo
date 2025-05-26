//
//  ProductColorCollectionCell.swift
//  AlwayGo
//
//  Created by Mac on 09.05.25.
//

import UIKit

class ProductColorCollectionCell: UICollectionViewCell {  
    private lazy var colorImageView: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 1
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFit
        image.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 100).cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override var isSelected: Bool {
        didSet {
            isSelectedCell()
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        contentView.addSubViews(colorImageView)
        NSLayoutConstraint.activate([
            colorImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            colorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            colorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            colorImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configureCell(with imageURL: String) {
        colorImageView.setImage(with: imageURL)
    }
    
    func isSelectedCell() {
        colorImageView.layer.borderColor = isSelected ? UIColor.black.cgColor: UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 100).cgColor
    }
}
