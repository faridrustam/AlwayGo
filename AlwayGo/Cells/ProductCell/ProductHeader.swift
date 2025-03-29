//
//  ProductHeader.swift
//  AlwayGo
//
//  Created by Mac on 18.03.25.
//

import UIKit

class ProductHeader: UIView {
    var index = 0
    var productImages = ["ProductImage", "ProductImage", "ProductImage", "ProductImage"]
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private lazy var buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ProductHeartButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var heartButtonView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.backgroundColor = .white
        view.addSubview(heartButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ShareButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var shareButtonView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.backgroundColor = .white
        view.addSubview(shareButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PlayButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var playButtonView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.backgroundColor = .white
        view.addSubview(playButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var likesBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 0.2
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var likesView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.borderWidth = 0.2
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var likesCount: UILabel = {
        let label = UILabel()
        label.text = "4K"
        label.textColor = .white
        label.font = UIFont(name: "SFProText-Semibold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heartImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "CountHeartButton")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        label.text = "Hair dryer Dyson HD07\nNICKEL PINK"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont(name: "SFProText-Semibold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkStockLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "SFProText-Regular", size: 14)
        let attributedString = NSMutableAttributedString.init(string: "in stock")
        attributedString.addAttribute(.underlineStyle, value: 1, range: .init(location: 0, length: attributedString.length))
        attributedString.addAttribute(.baselineOffset, value: 8, range: .init(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userReviewStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var starImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ProductStarImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "5.0"
        label.font = UIFont(name: "SFProText-Regular", size: 12)
        label.textColor = .black
        return label
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ProductCommentImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var commentCountLabel: UILabel = {
        let label = UILabel()
        label.text = "21 comments"
        label.font = UIFont(name: "SFProText-Regular", size: 12)
        label.textColor = .black
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
        backgroundColor = .white
        [collection, pageControl, buttonsStack, likesBackgroundView, likesView, productName, checkStockLabel, userReviewStack].forEach({ addSubview($0) })
        [heartButtonView, shareButtonView, playButtonView].forEach({ buttonsStack.addArrangedSubview($0) })
        likesBackgroundView.addSubview(likesView)
        [likesCount, heartImage].forEach({ likesView.addSubview($0) })
        [starImage, ratingLabel, commentButton, commentCountLabel].forEach({ userReviewStack.addArrangedSubview($0) })
        collection.backgroundColor = .systemGray5
        collection.register(ProductHeaderCell.self, forCellWithReuseIdentifier: "\(ProductHeaderCell.self)")
        pageControl.numberOfPages = productImages.count
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: productName.topAnchor, constant: -16),
            
            buttonsStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            buttonsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buttonsStack.widthAnchor.constraint(equalToConstant: 40),
            
            heartButtonView.widthAnchor.constraint(equalToConstant: 40),
            heartButtonView.heightAnchor.constraint(equalToConstant: 40),
            
            heartButton.centerYAnchor.constraint(equalTo: heartButtonView.centerYAnchor),
            heartButton.centerXAnchor.constraint(equalTo: heartButtonView.centerXAnchor),
            
            shareButton.centerYAnchor.constraint(equalTo: shareButtonView
                .centerYAnchor),
            shareButton.centerXAnchor.constraint(equalTo: shareButtonView.centerXAnchor),
            
            playButton.centerYAnchor.constraint(equalTo: playButtonView.centerYAnchor),
            playButton.centerXAnchor.constraint(equalTo: playButtonView.centerXAnchor),
            
            shareButtonView.widthAnchor.constraint(equalToConstant: 40),
            shareButtonView.heightAnchor.constraint(equalToConstant: 40),
            
            playButtonView.widthAnchor.constraint(equalToConstant: 40),
            playButtonView.heightAnchor.constraint(equalToConstant: 40),
            
            likesBackgroundView.trailingAnchor.constraint(equalTo: collection.trailingAnchor),
            likesBackgroundView.bottomAnchor.constraint(equalTo: collection.bottomAnchor, constant: -16),
            likesBackgroundView.widthAnchor.constraint(equalToConstant: 55),
            likesBackgroundView.heightAnchor.constraint(equalToConstant: 32),
            
            likesView.trailingAnchor.constraint(equalTo: collection.trailingAnchor, constant: 0),
            likesView.centerYAnchor.constraint(equalTo: likesBackgroundView.centerYAnchor),
            likesView.widthAnchor.constraint(equalToConstant: 54),
            likesView.heightAnchor.constraint(equalToConstant: 30),
            
            likesCount.leadingAnchor.constraint(equalTo: likesView.leadingAnchor, constant: 12),
            likesCount.topAnchor.constraint(equalTo: likesView.topAnchor, constant: 4),
            likesCount.bottomAnchor.constraint(equalTo: likesView.bottomAnchor, constant: -4),
            
            heartImage.leadingAnchor.constraint(equalTo: likesCount.trailingAnchor, constant: 2),
            heartImage.centerYAnchor.constraint(equalTo: likesCount.centerYAnchor),
            
            pageControl.centerXAnchor.constraint(equalTo: collection.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: collection.bottomAnchor, constant: -16),
            
            productName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            productName.trailingAnchor.constraint(equalTo: checkStockLabel.leadingAnchor, constant: -4),
            
            checkStockLabel.centerYAnchor.constraint(equalTo: productName.centerYAnchor),
            checkStockLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            userReviewStack.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 4),
            userReviewStack.leadingAnchor.constraint(equalTo: productName.leadingAnchor),
            userReviewStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            starImage.widthAnchor.constraint(equalToConstant: 14),
            starImage.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
}

extension ProductHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProductHeaderCell.self)", for: indexPath) as! ProductHeaderCell
        cell.configureImage(with: productImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 450)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        index = pageControl.currentPage
    }
}

#Preview {
    ProductHeader()
}
