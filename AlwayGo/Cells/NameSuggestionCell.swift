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

    override func awakeFromNib() {
        super.awakeFromNib()

        configureConsraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func configureConsraints() {
        addSubview(nameLabel)
        addSubview(iconImage)
        addSubview(suggestionView)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            suggestionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            suggestionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            suggestionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            suggestionView.trailingAnchor.constraint(equalTo: leadingAnchor),
            
            iconImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            iconImage.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 24),
            iconImage.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    func configureLabel(suggestName: String) {
        nameLabel.text = suggestName
    }
}
