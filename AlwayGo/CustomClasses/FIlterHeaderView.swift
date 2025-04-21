//
//  FIlterHeaderView.swift
//  AlwayGo
//
//  Created by Mac on 12.04.25.
//

import UIKit
import Foundation

class FIlterHeaderView: UIView {
    private lazy var onlyDiscountLabel: UILabel = {
        let label = UILabel()
        label.text = "Only Discounted Products"
        label.font = .customFont(.sfProRegular, size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var discountSwitch: UISwitch = {
       let discountSwitch = UISwitch()
        discountSwitch.translatesAutoresizingMaskIntoConstraints = false
        return discountSwitch
    }()
    
    private lazy var onlyFastDeliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Only Fast Delivery Products"
        label.font = .customFont(.sfProRegular, size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var deliverySwitch: UISwitch = {
       let deliverySwitch = UISwitch()
        deliverySwitch.translatesAutoresizingMaskIntoConstraints = false
        return deliverySwitch
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
        backgroundColor = .white
    }
    
    private func configureConstraints() {
        addSubViews(onlyDiscountLabel, discountSwitch, onlyFastDeliveryLabel, deliverySwitch)
        NSLayoutConstraint.activate([
            onlyDiscountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            onlyDiscountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            discountSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            discountSwitch.centerYAnchor.constraint(equalTo: onlyDiscountLabel.centerYAnchor),
            
            onlyFastDeliveryLabel.leadingAnchor.constraint(equalTo: onlyDiscountLabel.leadingAnchor),
            onlyFastDeliveryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            deliverySwitch.trailingAnchor.constraint(equalTo: discountSwitch.trailingAnchor),
            deliverySwitch.centerYAnchor.constraint(equalTo: onlyFastDeliveryLabel.centerYAnchor)
        ])
    }
}
