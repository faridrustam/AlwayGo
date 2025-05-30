//
//  CartController.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class CartController: BaseController {
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 14
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .medium)
        loadingView.tintColor = .blue
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()
    
    private let viewModel = CartViewModel(cartManager: CartManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        navigationItem.title = "CART \(viewModel.items?.list?.count ?? 0)"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.customFont(.sfProSemibold, size: 16),
                                                                   .foregroundColor: UIColor.black]
    }
    
    override func configureConstraints() {
        view.addSubViews(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func configureviewModel() {
        viewModel.getCartItems()
        viewModel.sendState = { [weak self] state in
            guard let self else { return }
            switch state {
            case .success:
                collection.reloadData()
            case .loading:
                loadingView.startAnimating()
            case .loaded:
                loadingView.stopAnimating()
            case .error(message: let message):
                showAlert(message: message)
            case .idle:
                break
            }
        }
    }
}
//extension CartController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    
//}
