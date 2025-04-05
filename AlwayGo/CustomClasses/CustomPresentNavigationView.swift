//
//  PresentControllerItem.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 24.03.25.
//

import Foundation
import UIKit

class CustomPresentNavigationView: UIView {
    
    var iconTapped: (() -> Void)?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CREATE BOARD"
        label.font = .customFont(.sfProSemibold, size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Xicon"), for: .normal)
        button.addTarget(self, action: #selector(iconButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        addSubViews(titleLabel, iconButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            iconButton.topAnchor.constraint(equalTo: topAnchor),
            iconButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            iconButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func iconButtonTapped() {
        iconTapped?()
    }
    
    func configure(with title: String, iconName: String) {
        titleLabel.text = title
        iconButton.setImage(UIImage(named: iconName), for: .normal)
    }
}
