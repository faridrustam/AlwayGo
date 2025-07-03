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
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var productCompany: UILabel = {
        let label = UILabel()
        label.text = "Dress"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        label.font = .customFont(.sfProMedium, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        label.font = .customFont(.sfProMedium, size: 12)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
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
        label.font = .customFont(.sfProRegular, size: 12)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productPrice: UILabel = {
        let label = UILabel()
        label.text = "1579 ₼"
        label.font = .customFont(.sfProSemibold, size: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
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
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .app
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.setTitle("Add to cart", for: .normal)
        button.titleLabel?.font = .customFont(.sfProSemibold, size: 16)
        button.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cartManager = CartManager()
    var product: Product?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addToCartButtonTapped() {
        guard let product else { return }
        let params: [String: [String: Any]] = [
            "list": [
                "productId": product.id ?? "",
                "variantId": product.variants?.first?.id ?? "",
                "count": 1
            ]
        ]
        cartManager.sendProductData(params: params) { _, _ in }
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        contentView.addSubViews(productImage, productCompany, productName, ratingImage, productShipping, productPrice, buttonStack)
        buttonStack.addArrangedSubViews(addToCartButton)
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
            addToCartButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func addProduct(with product: Product) {
        productImage.setImage(with: product.variants?.first?.images?.first?.url ?? "")
        productName.text = product.title
        productPrice.text = String(describing: product.variants?.first?.price ?? 0) + " ₼"
    }
}
