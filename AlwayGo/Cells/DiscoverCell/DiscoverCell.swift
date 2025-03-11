//
//  DiscoverCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 09.03.25.

import UIKit

class DiscoverCell: UICollectionViewCell {
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Medium", size: 20)
        label.textColor = .label
        label.text = "DISCOVER"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Medium", size: 20)
        label.textColor = .white
        label.text = "New Season"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var discoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "discover")
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        //!headerLabel.isHidden = true
    }
    
    private func configureConstraints() {
//        addSubview(headerLabel)
//        addSubview(discoverImageView)
//        discoverImageView.addSubview(titleLabel)
//        
//        NSLayoutConstraint.activate([
//            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
//            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            
//            titleLabel.centerXAnchor.constraint(equalTo: discoverImageView.centerXAnchor),
//            titleLabel.centerYAnchor.constraint(equalTo: discoverImageView.centerYAnchor),
//            
//            discoverImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
//            discoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            discoverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
//            discoverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
        
        var constraints: [NSLayoutConstraint] = []
        addSubview(discoverImageView)
        discoverImageView.addSubview(titleLabel)

        if !headerLabel.isHidden {
            addSubview(headerLabel)
            constraints.append(contentsOf: [
                headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
                headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                discoverImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16)
                ])
        } else {
            constraints.append(contentsOf: [topAnchor.constraint(equalTo: contentView.topAnchor)])
        }

        constraints.append(contentsOf: [
            titleLabel.centerXAnchor.constraint(equalTo: discoverImageView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: discoverImageView.centerYAnchor),

            discoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            discoverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            discoverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])

        NSLayoutConstraint.activate(constraints)
        }
    
    func configure(hide: Bool = true) {
        headerLabel.isHidden = hide
    }
}

