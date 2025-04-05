//
//  ProfileButtonsCell.swift
//  AlwayGo
//
//  Created by Mac on 29.03.25.
//

import UIKit

class ProfileButtonsCell: UITableViewCell {
    private lazy var allOrdersButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "AllOrders"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var allOrdersLabel: UILabel = {
        let label = UILabel()
        label.text = "All orders"
        label.font = .customFont(.sfProRegular, size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var reviewsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "Reviews"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var reviewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reviews"
        label.font = .customFont(.sfProRegular, size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var forYouButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "ForYou"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var forYouLabel: UILabel = {
        let label = UILabel()
        label.text = "For you"
        label.font = .customFont(.sfProRegular, size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var recentsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "Recents"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var recentsLabel: UILabel = {
        let label = UILabel()
        label.text = "Recents"
        label.font = .customFont(.sfProRegular, size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
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
        contentView.layer.backgroundColor = UIColor(red: 0.928, green: 0.928, blue: 0.928, alpha: 1).cgColor
        contentView.addSubViews(allOrdersButton, allOrdersLabel, reviewsButton, reviewsLabel, forYouButton, forYouLabel, recentsButton, recentsLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            allOrdersButton.widthAnchor.constraint(equalToConstant: 80),
            allOrdersButton.heightAnchor.constraint(equalToConstant: 60),
            allOrdersButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            allOrdersButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            allOrdersLabel.topAnchor.constraint(equalTo: allOrdersButton.bottomAnchor, constant: 8),
            allOrdersLabel.centerXAnchor.constraint(equalTo: allOrdersButton.centerXAnchor),
            
            reviewsButton.widthAnchor.constraint(equalToConstant: 80),
            reviewsButton.heightAnchor.constraint(equalToConstant: 60),
            reviewsButton.leadingAnchor.constraint(equalTo: allOrdersButton.trailingAnchor, constant: 16),
            reviewsButton.topAnchor.constraint(equalTo: allOrdersButton.topAnchor),
            
            reviewsLabel.topAnchor.constraint(equalTo: reviewsButton.bottomAnchor, constant: 8),
            reviewsLabel.centerXAnchor.constraint(equalTo: reviewsButton.centerXAnchor),
            
            forYouButton.widthAnchor.constraint(equalToConstant: 80),
            forYouButton.heightAnchor.constraint(equalToConstant: 60),
            forYouButton.leadingAnchor.constraint(equalTo: reviewsButton.trailingAnchor, constant: 16),
            forYouButton.topAnchor.constraint(equalTo: reviewsButton.topAnchor),
            
            forYouLabel.topAnchor.constraint(equalTo: reviewsButton.bottomAnchor, constant: 8),
            forYouLabel.centerXAnchor.constraint(equalTo: forYouButton.centerXAnchor),
            
            recentsButton.widthAnchor.constraint(equalToConstant: 80),
            recentsButton.heightAnchor.constraint(equalToConstant: 60),
            recentsButton.leadingAnchor.constraint(equalTo: forYouButton.trailingAnchor, constant: 16),
            recentsButton.topAnchor.constraint(equalTo: forYouButton.topAnchor),
            recentsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            recentsLabel.topAnchor.constraint(equalTo: recentsButton.bottomAnchor, constant: 8),
            recentsLabel.centerXAnchor.constraint(equalTo: recentsButton.centerXAnchor),
        ])
    }
}
