//
//  boardSuggestName.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 23.03.25.
//

import UIKit

class BoardSuggestionNameView: UIView {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow-up-left")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConsraints() {
        addSubview(nameLabel)
        addSubview(iconImage)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            iconImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            iconImage.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 24),
            iconImage.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
        
    func configureLabel(suggestName: String) {
        nameLabel.text = suggestName
    }
    
    func getSuggestionText() -> String {
        return nameLabel.text ?? ""
    }
}
