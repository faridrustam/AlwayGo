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
        view.layer.borderColor = UIColor(named: "AppColor")?.cgColor
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
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "headerIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
    }
    
    private func configureConstraints() {
        contentView.addSubview(categoryView)
        categoryView.addSubview(categoryLabel)
        categoryView.addSubview(icon)
        
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            categoryLabel.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor)
        ])
        
        if icon.isHidden {
            NSLayoutConstraint.activate([
                categoryLabel.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 16),
                categoryLabel.trailingAnchor.constraint(equalTo: categoryView.trailingAnchor, constant: -16)
            ])
        } else {
            NSLayoutConstraint.activate([
                icon.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 8),
                icon.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor),
                icon.trailingAnchor.constraint(equalTo: categoryLabel.leadingAnchor, constant: -8),

                categoryLabel.trailingAnchor.constraint(equalTo: categoryView.trailingAnchor, constant: -16)
            ])
        }
    }
    
    func configure(text: String, hideIcon: Bool) {
        categoryLabel.text = text
        icon.isHidden = hideIcon
        configureConstraints()
    }
}
