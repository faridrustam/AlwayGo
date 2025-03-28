//
//  BoardsCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 20.03.25.
//

import UIKit

class BoardsCell: UICollectionViewCell {
    
    var createTapped: (() -> Void)?
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var imageViews: [UIImageView] = {
        return (0..<3).map { _ in
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 8
            imageView.backgroundColor = .lightGray
            return imageView
        }
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "BOARDS"
        label.font = UIFont(name: "SFProText-Bold", size: 16)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Group your favorite items to suit you"
        label.font = UIFont(name: "SFProText-Regular", size: 14)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create board", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Bold", size: 14)
        button.backgroundColor = UIColor.app
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    }
    
    private func configureConstraints() {
        [stackView, titleLabel, subtitleLabel, createButton].forEach({contentView.addSubview($0)})
        
        imageViews.forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            stackView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            createButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            createButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            createButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            createButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            createButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc private func createButtonTapped() {
        createTapped?()
    }
    
    func configure(with images: [UIImage]) {
        for (index, image) in images.enumerated() {
            if index < imageViews.count {
                imageViews[index].image = image
            }
        }
    }
}
