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
        label.text = "Size"
        label.font = UIFont(name: "SFProText-Medium", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productSize: UILabel = {
        let label = UILabel()
        label.text = "Standard"
        label.font = UIFont(name: "SFProText-Regular", size: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        [sizeLabel, productSize].forEach({ contentView.addSubview($0) })
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            sizeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sizeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            productSize.centerYAnchor.constraint(equalTo: sizeLabel.centerYAnchor),
            productSize.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
