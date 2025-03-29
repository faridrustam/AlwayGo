//
//  ProductInfoCell.swift
//  AlwayGo
//
//  Created by Mac on 22.03.25.
//

import UIKit

class ProductInfoCell: UITableViewCell {
    private lazy var productInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 16)
        label.text = "Intelligent heat control helps protect your hair's natural shine. Powered by a powerful Dyson digital motor V9, spinning at up to 110,000rpm. With Air Multiplier™ technology to produce a high-pressure jet of controlled air, for fast drying and precision styling."
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(productInfo)
        NSLayoutConstraint.activate([
            productInfo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36),
            productInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            productInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -36),
        ])
    }
}
