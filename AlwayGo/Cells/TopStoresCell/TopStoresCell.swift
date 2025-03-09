//
//  TopStoresCell.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class TopStoresCell: UICollectionViewCell {
    private lazy var storeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 0.2
        view.backgroundColor = .white
//        view.layer.shadowColor = UIColor.gray.cgColor
//        view.layer.shadowOpacity = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var storeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        contentView.addSubview(storeView)
        storeView.addSubview(storeImage)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            storeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            storeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            storeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            storeImage.centerXAnchor.constraint(equalTo: storeView.centerXAnchor),
            storeImage.centerYAnchor.constraint(equalTo: storeView.centerYAnchor)
        ])
    }
    
    func configCell(image: String) {
        storeImage.image = UIImage(named: image)
    }
}
