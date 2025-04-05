//
//  ProfileSectionsCell.swift
//  AlwayGo
//
//  Created by Mac on 30.03.25.
//

import UIKit

class ProfileSectionsCell: UITableViewCell {
    
    private lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(.sfProMedium, size: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ProfileButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        contentView.addSubViews(cellImage, titleLabel, cellButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            cellImage.widthAnchor.constraint(equalToConstant: 24),
            cellImage.heightAnchor.constraint(equalToConstant: 24),
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            titleLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: cellImage.centerYAnchor),
            
            cellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    func configureCell(with model: ProfileSettings) {
        cellImage.image = UIImage(named: model.imageName)
        titleLabel.text = model.title
    }
}
