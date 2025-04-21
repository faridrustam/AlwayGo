//
//  CategoryProductHeader.swift
//  AlwayGo
//
//  Created by Mac on 04.04.25.
//

import UIKit

class CategoryProductHeader: UIView {
    var filterButtonHandle: (() -> Void)?
    
    private lazy var sortButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sort", for: .normal)
        button.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        button.imageEdgeInsets = .init(top: 0, left: -8, bottom: 0, right: 0)
        button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.87), for: .normal)
        button.imageView?.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Filter", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.87), for: .normal)
        button.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        button.imageView?.tintColor = .black
        button.imageEdgeInsets = .init(top: 0, left: -8, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
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
    
    @objc func filterButtonTapped() {
        filterButtonHandle?()
    }
    
    private func configureUI() {
        backgroundColor = .white
        addSubViews(sortButton, lineView, filterButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            sortButton.widthAnchor.constraint(equalToConstant: 177),
            sortButton.heightAnchor.constraint(equalToConstant: 40),
            sortButton.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            sortButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sortButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            
            lineView.widthAnchor.constraint(equalToConstant: 1),
            lineView.heightAnchor.constraint(equalToConstant: 20),
            lineView.leadingAnchor.constraint(equalTo: sortButton.trailingAnchor, constant: 8),
            lineView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            filterButton.widthAnchor.constraint(equalToConstant: 177),
            filterButton.heightAnchor.constraint(equalToConstant: 40),
            filterButton.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            filterButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
}
