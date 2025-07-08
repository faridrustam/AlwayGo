//
//  CartCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 30.05.25.
//

import UIKit

class CartCell: UICollectionViewCell {
    
    private lazy var productImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "discover")
        i.contentMode = .scaleAspectFill
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private lazy var productName: UILabel = {
        let n = UILabel()
        n.text = "Apple iPhone 13 Pro Max"
        n.font = .customFont(.sfProRegular, size: 20)
        n.translatesAutoresizingMaskIntoConstraints = false
        return n
    }()
    
    private lazy var productColor: UILabel = {
        let n = UILabel()
        n.text = "Color: White"
        n.font = .customFont(.sfProRegular, size: 14)
        n.translatesAutoresizingMaskIntoConstraints = false
        return n
    }()
    
    private lazy var counter: UILabel = {
        let n = UILabel()
        n.text = "Count: \(1)"
        n.font = .customFont(.sfProRegular, size: 14)
        n.translatesAutoresizingMaskIntoConstraints = false
        return n
    }()
    
    private lazy var price: UILabel = {
        let n = UILabel()
        n.text = "999$"
        n.font = .customFont(.sfProRegular, size: 14)
        n.translatesAutoresizingMaskIntoConstraints = false
        return n
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.value = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    var countChange: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        productImage.layer.cornerRadius = 16
        productImage.layer.masksToBounds = true
        contentView.backgroundColor = .white
    }
    
    private func configureConstraints() {
        contentView.addSubViews(productImage, price, productName, productColor, stepper, counter)
        NSLayoutConstraint.activate([
            productImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productImage.widthAnchor.constraint(equalToConstant: 80),
            productImage.heightAnchor.constraint(equalToConstant: 84),
            
            productName.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12),
            productName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            productName.heightAnchor.constraint(equalToConstant: 26),
            
            productColor.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
            productColor.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12),
            productColor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            productColor.heightAnchor.constraint(equalToConstant: 16),
            
            counter.topAnchor.constraint(equalTo: productColor.bottomAnchor, constant: 8),
            counter.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12),
            counter.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            counter.heightAnchor.constraint(equalToConstant: 14),
            
            price.topAnchor.constraint(equalTo: productColor.bottomAnchor, constant: 28),
            price.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12),
            price.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            price.heightAnchor.constraint(equalToConstant: 20),
            
            stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stepper.centerYAnchor.constraint(equalTo: price.centerYAnchor)
        ])
    }
    
    func configureCell(product: GetCartList) {
        productName.text = product.productId?.title
        productColor.text = product.productId?.specs?[1].values?.first?.key
        counter.text = "Count: \(product.count ?? 1)"
        price.text = "Price: \((product.price ?? 0) * (product.count ?? 1))$"
        productImage.setImage(with: product.productId?.variants?.first?.images?.first?.url)
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
        countChange?()
        print("tapped")
    }
}
