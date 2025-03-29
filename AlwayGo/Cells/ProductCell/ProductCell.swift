//
//  ProductCell.swift
//  AlwayGo
//
//  Created by Mac on 18.03.25.
//

import UIKit

class ProductCell: UITableViewCell {
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Medium", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PlusButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var cellInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        contentView.addSubViews(cellLabel, plusButton, cellInfoLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            plusButton.centerYAnchor.constraint(equalTo: cellLabel.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            cellInfoLabel.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 28),
            cellInfoLabel.leadingAnchor.constraint(equalTo: cellLabel.leadingAnchor),
            cellInfoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16)
        ])
    }
    
    func configureCell(with text: String) {
        cellLabel.text = text
    }
    
    func configureInfo(with text: String) {
        cellInfoLabel.text = text
    }
}
