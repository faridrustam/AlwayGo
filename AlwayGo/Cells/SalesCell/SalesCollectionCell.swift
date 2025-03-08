//
//  SalesCell.swift
//  AlwayGo
//
//  Created by Mac on 07.03.25.
//

import UIKit

class SalesCollectionCell: UICollectionViewCell {
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.frame = CGRect(x: 0, y: 0, width: 100, height: 400)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    private func configUI() {
        contentView.addSubview(collection)
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(setupScroll), userInfo: nil, repeats: true)
    }
    
    @objc func setupScroll() {
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: contentView.topAnchor),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            pageControl.centerYAnchor.constraint(equalTo: collection.centerYAnchor),
            pageControl.bottomAnchor.constraint(equalTo: collection.bottomAnchor, constant: -8)
        ])
    }
}
