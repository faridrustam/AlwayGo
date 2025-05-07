//
//  CategoryProductController.swift
//  AlwayGo
//
//  Created by Mac on 04.04.25.
//

import UIKit

class CategoryProductController: BaseController {
    private lazy var productHeaderView: CategoryProductHeader = {
        let view = CategoryProductHeader()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 16, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 16
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.layer.backgroundColor = UIColor(red: 0.928, green: 0.928, blue: 0.928, alpha: 1).cgColor
        collection.delegate = self
        collection.dataSource = self
        collection.register(CategoryProductCell.self, forCellWithReuseIdentifier: "\(CategoryProductCell.self)")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var shareSheet: UIActivityViewController = {
        let sheet = UIActivityViewController(activityItems: [viewModel.getURL()], applicationActivities: nil)
        return sheet
    }()
    
    let viewModel = CategoryProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func shareButtonTapped() {
        present(shareSheet, animated: true)
    }
    
    override func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.customFont(.sfProSemibold, size: 16),
                                                                   .foregroundColor: UIColor.black]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ShareButton"), style: .plain, target: self, action: #selector(shareButtonTapped))
        let backButton = UIImage(named: "CategoryDetailBackButton")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        navigationController?.navigationBar.topItem?.title = ""
        configureButtons()
    }
    
    override func configureConstraints() {
        view.addSubViews(productHeaderView, collection)
        NSLayoutConstraint.activate([
            productHeaderView.heightAnchor.constraint(equalToConstant: 48),
            productHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            productHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            collection.topAnchor.constraint(equalTo: productHeaderView.bottomAnchor, constant: 16),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configureButtons() {
        productHeaderView.filterButtonHandle = { [weak self] in
            guard let self else { return }
            let coordinator = CategoryFlowCoordinator(navigationController: navigationController ?? UINavigationController(),
                                                      title: nil)
            coordinator.showFilter()
        }
    }
}

extension CategoryProductController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryProductCell.self)",
                                                      for: indexPath) as! CategoryProductCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 6, height: 367)
    }
}
