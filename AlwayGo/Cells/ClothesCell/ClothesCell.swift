//
//  ClothesCell.swift
//  AlwayGo
//
//  Created by Mac on 08.03.25.
//

import UIKit

class ClothesCell: UICollectionViewCell {
    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var clothImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "girlImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var clothName: UILabel = {
       let label = UILabel()
        label.text = "Miss Murem Kruvuaze Baglamali Hirka"
        print(label.text?.count ?? 1)
        label.font = .customFont(.sfProRegular, size: 14)
        var mutableString = NSMutableAttributedString(string: label.text ?? "")
        mutableString.addAttribute(.foregroundColor,
                                   value: UIColor.gray,
                                   range: NSRange(location: 11, length: 24))
        label.textColor = .black
        label.numberOfLines = 0
        label.attributedText = mutableString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var clothPrice: UILabel = {
        let label = UILabel()
        label.text = "35.69 ₼"
        label.font = .customFont(.sfProHeavy, size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heartView: UIView = {
        let view = UIButton()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heartButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var bagView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bagButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bag"), for: .normal)
        button.imageView?.tintColor = .black
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
        cellView.addSubViews(clothImage, clothName, clothPrice, heartView, bagView)
        contentView.addSubview(cellView)
        heartView.addSubview(heartButton)
        bagView.addSubview(bagButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            clothImage.topAnchor.constraint(equalTo: cellView.topAnchor),
            clothImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            clothImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            clothImage.heightAnchor.constraint(equalToConstant: 200),
            
            clothName.topAnchor.constraint(equalTo: clothImage.bottomAnchor, constant: 8),
            clothName.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 8),
            clothName.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -8),
            
            clothPrice.topAnchor.constraint(equalTo: clothName.bottomAnchor, constant: 4),
            clothPrice.leadingAnchor.constraint(equalTo: clothName.leadingAnchor),
            
            heartView.widthAnchor.constraint(equalToConstant: 24),
            heartView.heightAnchor.constraint(equalToConstant: 24),
            heartView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            heartView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -8),
            
            heartButton.widthAnchor.constraint(equalToConstant: 14.4),
            heartButton.heightAnchor.constraint(equalToConstant: 14.4),
            heartButton.centerXAnchor.constraint(equalTo: heartView.centerXAnchor),
            heartButton.centerYAnchor.constraint(equalTo: heartView.centerYAnchor),
            
            bagView.widthAnchor.constraint(equalToConstant: 24),
            bagView.heightAnchor.constraint(equalToConstant: 24),
            bagView.trailingAnchor.constraint(equalTo: heartView.trailingAnchor),
            bagView.bottomAnchor.constraint(equalTo: clothImage.bottomAnchor, constant: -8),
            
            bagButton.widthAnchor.constraint(equalToConstant: 14.4),
            bagButton.heightAnchor.constraint(equalToConstant: 14.4),
            bagButton.centerXAnchor.constraint(equalTo: bagView.centerXAnchor),
            bagButton.centerYAnchor.constraint(equalTo: bagView.centerYAnchor),
        ])
    }
    
    func configureProductCell(product: Product) {
        clothName.text = product.title
        clothPrice.text = "\(product.variants?.first?.price ?? 0) ₼"
        clothImage.setImage(with: product.variants?.first?.images?.first?.url)
    }
}
