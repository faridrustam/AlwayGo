//
//  ItemsView.swift
//  AlwayGo
//
//  Created by Mac on 17.03.25.
//

import UIKit

final class ItemsView: UIView {
    private lazy var itemsCountLabel: UILabel = {
        let label = UILabel()
        label.text = String(describing: products.count) + " items"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.font = .customFont(.sfProRegular, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var recentlyAddedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Recently added", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6), for: .normal)
        button.titleLabel?.font = .customFont(.sfProRegular, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var products: [Product] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .systemGray6
        addSubViews(itemsCountLabel, recentlyAddedButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            itemsCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            itemsCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            itemsCountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            recentlyAddedButton.centerYAnchor.constraint(equalTo: itemsCountLabel.centerYAnchor),
            recentlyAddedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func addProduct(product: [Product]) {
        products = product
    }
}
