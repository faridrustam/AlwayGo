//
//  ProductSizeCollectionCell.swift
//  AlwayGo
//
//  Created by Mac on 12.05.25.
//

import UIKit

class ProductSizeCollectionCell: UICollectionViewCell {
    private lazy var sizeView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(.sfProRegular, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            isSelectedCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(sizeView)
        sizeView.addSubview(sizeLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            sizeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sizeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sizeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sizeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            sizeLabel.centerXAnchor.constraint(equalTo: sizeView.centerXAnchor),
            sizeLabel.centerYAnchor.constraint(equalTo: sizeView.centerYAnchor),
        ])
    }
    
    func configureCell(with text: String) {
        sizeLabel.text = text
    }
    
    func isSelectedCell() {
        sizeView.layer.borderColor = isSelected ? UIColor.black.cgColor: UIColor.lightGray.cgColor
    }
}
