//
//  CategoryProductCell.swift
//  AlwayGo
//
//  Created by Mac on 04.04.25.
//

import UIKit

class CategoryProductCell: UICollectionViewCell {
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Shoes")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        label.text = "Moser"
        label.textColor = .black
        label.font = .customFont(.sfProSemibold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productType: UILabel = {
        let label = UILabel()
        label.text = "Yellow crystall vase"
        label.font = .customFont(.sfProRegular, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productPrice: UILabel = {
        let label = UILabel()
        label.text = "89 ₼"
        label.font = .customFont(.sfProSemibold, size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productDiscountView: UIView = {
        let view = UIView()
        view.layer.backgroundColor =  UIColor(red: 0.928, green: 0.928, blue: 0.928, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var productDiscountLabel: UILabel = {
        let label = UILabel()
        label.text = "2 or over 80 ₼"
        var mutableString = NSMutableAttributedString(string: label.text ?? "")
        mutableString.addAttribute(.font,
                                   value: UIFont.customFont(.sfProRegular, size: 10),
                                   range: NSRange(location: 0, length: 9))
        mutableString.addAttribute(.foregroundColor,
                                   value: UIColor.systemGreen,
                                   range: NSRange(location: 0, length: 9))
        label.font = .customFont(.sfProRegular, size: 14)
        label.attributedText = mutableString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        contentView.addSubViews(productImage, productName, productType, productPrice, productDiscountView)
        productDiscountView.addSubview(productDiscountLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalToConstant: 197),
            productImage.heightAnchor.constraint(equalToConstant: 235),
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            productName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            productType.topAnchor.constraint(equalTo: productName.bottomAnchor),
            productType.leadingAnchor.constraint(equalTo: productName.leadingAnchor),
            
            productPrice.topAnchor.constraint(equalTo: productType.bottomAnchor, constant: 16),
            productPrice.leadingAnchor.constraint(equalTo: productType.leadingAnchor),
            
            productDiscountView.widthAnchor.constraint(equalToConstant: 86),
            productDiscountView.heightAnchor.constraint(equalToConstant: 28),
            productDiscountView.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 12),
            productDiscountView.leadingAnchor.constraint(equalTo: productPrice.leadingAnchor),
            productDiscountView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            productDiscountLabel.leadingAnchor.constraint(equalTo: productDiscountView.leadingAnchor, constant: 4),
            productDiscountLabel.trailingAnchor.constraint(equalTo: productDiscountView.trailingAnchor, constant: -4),
            productDiscountLabel.topAnchor.constraint(equalTo: productDiscountView.topAnchor, constant: 4),
            productDiscountLabel.bottomAnchor.constraint(equalTo: productDiscountView.bottomAnchor, constant: -4)
        ])
    }
}
