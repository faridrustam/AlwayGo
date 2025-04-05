//
//  CategoryControllerCell.swift
//  AlwayGo
//
//  Created by Mac on 13.03.25.
//

import UIKit

class CategoryControllerCell: UICollectionViewCell {
    private lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "CategoryImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(.sfProSemibold, size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        if cellLabel.text == "Sale" {
            cellLabel.textColor = .red
        }
        contentView.addSubViews(cellImage, cellLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellLabel.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: 16),
            cellLabel.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: -12),
        ])
    }
    
    func configureCell(name: String) {
        cellLabel.text = name
        configureUI()
    }
}
