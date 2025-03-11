//
//  HeaderCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 08.03.25.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    private lazy var categoryView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: "categoryColor")?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 14)
        label.textColor = .black
        label.text = "Woman"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        contentView.addSubview(categoryView)
        categoryView.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            categoryLabel.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 16),
            categoryLabel.trailingAnchor.constraint(equalTo: categoryView.trailingAnchor, constant: -16),
            categoryLabel.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor)
            ])
    }
}
