//
//  FilterController.swift
//  AlwayGo
//
//  Created by Mac on 10.04.25.
//

import UIKit

class FilterController: BaseController {
    private lazy var filterHeader: FIlterHeaderView = {
        let view = FIlterHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var listProductsButton: UIButton = {
        let button = UIButton()
        button.setTitle("List Products", for: .normal)
        button.titleLabel?.font = .customFont(.sfProSemibold, size: 16)
        button.backgroundColor = .app
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
//        view.layer.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 100).cgColor
//        view.backgroundColor = .gray
        title = "Filter"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.customFont(.sfProSemibold, size: 16),
                                                                   .foregroundColor: UIColor.black]
        view.backgroundColor = .white
        let backButton = UIImage(named: "CategoryDetailBackButton")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 59/255, green: 123/255, blue: 13/255, alpha: 1)
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.customFont(.sfProMedium, size: 12)],
                                                                  for: .normal)
    }
    
    override func configureConstraints() {
        view.addSubViews(filterHeader, listProductsButton)
        NSLayoutConstraint.activate([
            filterHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            filterHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterHeader.heightAnchor.constraint(equalToConstant: 102),
            
            listProductsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            listProductsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            listProductsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -2),
            listProductsButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc func clearButtonTapped() {
        
    }
}
