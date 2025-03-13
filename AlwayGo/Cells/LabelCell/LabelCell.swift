//
//  LabelCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 13.03.25.
//

import UIKit

class LabelCell: UICollectionViewCell {
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Medium", size: 20)
        label.textColor = .label
        label.text = "DISCOVER"
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
        contentView.backgroundColor = .systemBackground
    }
    
    private func configureConstraints() {
        contentView.addSubview(typeLabel)
        
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            typeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            typeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
    }
}
