//
//  ClothesCell.swift
//  AlwayGo
//
//  Created by Mac on 08.03.25.
//

import UIKit

class ClothesCell: UICollectionViewCell {
    private lazy var clothImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "girlImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var clothName: UILabel = {
       let label = UILabel()
        label.text = "Miss Murem Kruvuaze Baglamali Hirka"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var clothPrice: UILabel = {
        let label = UILabel()
        label.text = "35.69"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonView: UIView = {
        let view = UIButton()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heartButton"), for: .normal)
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
        [clothImage, clothName, clothPrice, buttonView].forEach({ contentView.addSubview($0) })
        buttonView.addSubview(heartButton)
        buttonView.layer.cornerRadius = 12
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            clothImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            clothImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            clothImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            clothImage.heightAnchor.constraint(equalToConstant: 200),
            
            clothName.topAnchor.constraint(equalTo: clothImage.bottomAnchor, constant: 8),
            clothName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            clothName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            clothPrice.topAnchor.constraint(equalTo: clothName.bottomAnchor, constant: 4),
            clothPrice.leadingAnchor.constraint(equalTo: clothName.leadingAnchor),
            
            buttonView.widthAnchor.constraint(equalToConstant: 24),
            buttonView.heightAnchor.constraint(equalToConstant: 24),
            buttonView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            buttonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            heartButton.widthAnchor.constraint(equalToConstant: 14.4),
            heartButton.heightAnchor.constraint(equalToConstant: 14.4),
            heartButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            heartButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor)
        ])
    }
}
