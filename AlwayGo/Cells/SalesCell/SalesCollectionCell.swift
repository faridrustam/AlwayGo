//
//  SalesCell.swift
//  AlwayGo
//
//  Created by Mac on 07.03.25.
//

import UIKit

class SalesCollectionCell: UICollectionViewCell {
    var index = 0
    var photos = ["image1", "image2", "image3", "image4"]
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.frame = CGRect(x: 0, y: 0, width: 100, height: 400)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
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
        contentView.addSubViews(collection, pageControl)
        collection.delegate = self
        collection.dataSource = self
        collection.register(SalesCell.self, forCellWithReuseIdentifier: "\(SalesCell.self)")
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(setupScroll), userInfo: nil, repeats: true)
    }
    
    @objc func setupScroll() {
        if index < (photos.count) - 1 {
            index += 1
        } else {
            index = 0
        }
        pageControl.numberOfPages = photos.count
        pageControl.currentPage = index
        collection.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: contentView.topAnchor),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            pageControl.centerXAnchor.constraint(equalTo: collection.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: collection.bottomAnchor, constant: -8)
        ])
    }
}

extension SalesCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SalesCell.self)", for: indexPath) as! SalesCell
        cell.configureImage(image: photos[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 132)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        index = pageControl.currentPage
    }
}
