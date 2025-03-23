//
//  FavoritesCell.swift
//  AlwayGo
//
//  Created by Mac on 14.03.25.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Men")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var productCompany: UILabel = {
        let label = UILabel()
        label.text = "Technoaze"
        label.textColor = .black
        label.font = UIFont(name: "SFProText-Medium", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        label.text = "Asus VivoBook 15 X 1504ZA-Nj547Wi5-1235U 8 Gb 512 Gb 15.6” W11H Laptop"
        label.font = UIFont(name: "SFProText-Medium", size: 12)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "RatingImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var productShipping: UILabel = {
        let label = UILabel()
        label.text = "Free shipping"
        label.font = UIFont(name: "SFProText-Regular", size: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productPrice: UILabel = {
        let label = UILabel()
        label.text = "1579 ₼"
        label.font = UIFont(name: "SFProText-Semibold", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var sizeButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.app.cgColor
        button.layer.cornerRadius = 8
        button.setTitle("Size", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight: .forceRightToLeft
        button.setImage(UIImage(named: "DownButton"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .app
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.setTitle("Add to cart", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 16)
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

        contentView.backgroundColor = .white
        [productImage, productCompany, productName, ratingImage, productShipping, productPrice, buttonStack].forEach({ contentView.addSubview($0) })
        [sizeButton, addToCartButton].forEach({ buttonStack.addArrangedSubview($0) })
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImage.widthAnchor.constraint(equalToConstant: 106),
            productImage.heightAnchor.constraint(equalToConstant: 159),
            
            productCompany.topAnchor.constraint(equalTo: productImage.topAnchor),
            productCompany.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            
            productName.topAnchor.constraint(equalTo: productCompany.bottomAnchor, constant: 4),
            productName.leadingAnchor.constraint(equalTo: productCompany.leadingAnchor),
            
            ratingImage.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 16),
            ratingImage.leadingAnchor.constraint(equalTo: productName.leadingAnchor),
            
            productShipping.topAnchor.constraint(equalTo: ratingImage.bottomAnchor, constant: 4),
            productShipping.leadingAnchor.constraint(equalTo: ratingImage.leadingAnchor),
            
            productPrice.topAnchor.constraint(equalTo: productShipping.bottomAnchor, constant: 8),
            productPrice.leadingAnchor.constraint(equalTo: productShipping.leadingAnchor),
            
            buttonStack.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 12),
            buttonStack.leadingAnchor.constraint(equalTo: productPrice.leadingAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            addToCartButton.widthAnchor.constraint(equalToConstant: 148),
            addToCartButton.heightAnchor.constraint(equalToConstant: 40),
            sizeButton.widthAnchor.constraint(equalToConstant: 92)
        ])
    }
}

#Preview {
    FavoritesCell()
}
