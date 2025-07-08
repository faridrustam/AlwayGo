//
//  ProfileUserView.swift
//  AlwayGo
//
//  Created by Mac on 29.03.25.
//

import UIKit

class ProfileUserView: UIView {
    private lazy var userNameView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.backgroundColor = UIColor(red: 0.928, green: 0.928, blue: 0.928, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userInitialLetters: UILabel = {
        let label = UILabel()
        label.text = userName.first?.uppercased()
        label.font = .customFont(.sfProSemibold, size: 22)
        label.textColor = .app
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi, \(userName)"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        label.font = .customFont(.sfProSemibold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.text = KeychainManager.shared.getEmail()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.font = .customFont(.sfProRegular, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Settings"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var addNumberView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.backgroundColor = UIColor(red: 0.928, green: 0.928, blue: 0.928, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var exclamationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Exclamation")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var addNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        label.text = "Add your phone number now to enjoy the best shopping experience."
        label.font = .customFont(.sfProRegular, size: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addNumberButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .app
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.setTitle("Add Number", for: .normal)
        button.titleLabel?.font = .customFont(.sfProRegular, size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let userName = UserDefaultsManager.shared.getString(for: .username)

    override init(frame: CGRect) {
        super.init(frame: frame)
     
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        layer.cornerRadius = 8
        addSubViews(userNameView, userNameLabel, userEmailLabel, settingsButton/*, addNumberView*/)
        userNameView.addSubview(userInitialLetters)
        //addNumberView.addSubViews(exclamationImage, addNumberLabel, addNumberButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            userNameView.widthAnchor.constraint(equalToConstant: 60),
            userNameView.heightAnchor.constraint(equalToConstant: 60),
            userNameView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            userNameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            userInitialLetters.centerXAnchor.constraint(equalTo: userNameView.centerXAnchor),
            userInitialLetters.centerYAnchor.constraint(equalTo: userNameView.centerYAnchor),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userNameView.trailingAnchor, constant: 16),
            userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            
            userEmailLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userEmailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 4),
            
            settingsButton.widthAnchor.constraint(equalToConstant: 24),
            settingsButton.heightAnchor.constraint(equalToConstant: 24),
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            settingsButton.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            
//            addNumberView.widthAnchor.constraint(equalToConstant: 338),
//            addNumberView.heightAnchor.constraint(equalToConstant: 116),
//            addNumberView.topAnchor.constraint(equalTo: userNameView.bottomAnchor, constant: 12),
//            addNumberView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            addNumberView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
//            exclamationImage.widthAnchor.constraint(equalToConstant: 24),
//            exclamationImage.heightAnchor.constraint(equalToConstant: 24),
//            exclamationImage.leadingAnchor.constraint(equalTo: addNumberView.leadingAnchor, constant: 16),
//            exclamationImage.topAnchor.constraint(equalTo: addNumberView.topAnchor, constant: 16),
//            
//            addNumberLabel.centerYAnchor.constraint(equalTo: exclamationImage.centerYAnchor),
//            addNumberLabel.leadingAnchor.constraint(equalTo: exclamationImage.trailingAnchor, constant: 12),
//            addNumberLabel.trailingAnchor.constraint(equalTo: addNumberView.trailingAnchor, constant: -4),
//            
//            addNumberButton.widthAnchor.constraint(equalToConstant: 144),
//            addNumberButton.heightAnchor.constraint(equalToConstant: 40),
//            addNumberButton.topAnchor.constraint(equalTo: addNumberLabel.bottomAnchor, constant: 12),
//            addNumberButton.leadingAnchor.constraint(equalTo: addNumberLabel.leadingAnchor),
//            addNumberButton.bottomAnchor.constraint(equalTo: addNumberView.bottomAnchor, constant: -16)
        ])
    }

}
