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
        label.text = "Color"
        label.font = UIFont(name: "SFProText-Medium", size: 16)
        label.textColor = .black
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
        contentView.addSubview(colorLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            colorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            colorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
