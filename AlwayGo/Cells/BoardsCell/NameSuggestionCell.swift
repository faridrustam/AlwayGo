//
//  NameSuggestionCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 28.03.25.
//

import UIKit

class NameSuggestionCell: UITableViewCell {
    
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
    
    private lazy var suggestionView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(iconImage)
        contentView.addSubview(suggestionView)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            suggestionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            suggestionView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            suggestionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            iconImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            iconImage.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 24),
            iconImage.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    func configureLabel(suggestName: String) {
        nameLabel.text = suggestName
    }
}
