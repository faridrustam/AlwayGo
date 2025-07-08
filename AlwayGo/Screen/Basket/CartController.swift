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
        layout.minimumLineSpacing = 2
        layout.sectionInset = .init(top: 2, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray6
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(CartCell.self, forCellWithReuseIdentifier: "\(CartCell.self)")
        return collection
    }()
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .medium)
        loadingView.tintColor = .blue
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()
    
    private lazy var checkoutView: UIView = {
        let t = UIView()
        t.layer.borderWidth = 0.5
        t.layer.borderColor = UIColor.app.cgColor
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private lazy var totalPriceText: UILabel = {
        let l = UILabel()
        l.textColor = .app
        l.text = "Total Price:"
        l.font = UIFont.customFont(.sfProSemibold, size: 18)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var totalPrice: UILabel = {
        let l = UILabel()
        l.text = "999$"
        l.textColor = .black
        l.font = UIFont.customFont(.sfProSemibold, size: 16)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var checkoutButton: UIButton = {
        let b = UIButton(type: .system)
        b.backgroundColor = .app
        b.setTitle("CHECKOUT", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont.customFont(.sfProSemibold, size: 16)
        b.layer.cornerRadius = 16
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(goToCheckout), for: .touchUpInside)
        return b
    }()
    
    private let viewModel = CartViewModel(cartManager: CartManager(), orderManager: OrderManager())
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.customFont(.sfProSemibold, size: 16),
                                                                   .foregroundColor: UIColor.black]
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        collection.refreshControl = refreshControl
    }
    
    override func configureConstraints() {
        view.addSubViews(collection, checkoutView)
        checkoutView.addSubViews(totalPriceText, totalPrice, checkoutButton)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            checkoutView.topAnchor.constraint(equalTo: collection.bottomAnchor),
            checkoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            checkoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            checkoutView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            totalPriceText.topAnchor.constraint(equalTo: checkoutView.topAnchor, constant: 16),
            totalPriceText.leadingAnchor.constraint(equalTo: checkoutView.leadingAnchor, constant: 24),
            totalPriceText.heightAnchor.constraint(equalToConstant: 20),
            
            totalPrice.centerXAnchor.constraint(equalTo: totalPriceText.centerXAnchor),
            totalPrice.topAnchor.constraint(equalTo: totalPriceText.bottomAnchor, constant: 4),
            totalPrice.leadingAnchor.constraint(equalTo: totalPriceText.leadingAnchor),
            totalPrice.heightAnchor.constraint(equalToConstant: 20),
            
            checkoutButton.topAnchor.constraint(equalTo: checkoutView.topAnchor, constant: 16),
            checkoutButton.trailingAnchor.constraint(equalTo: checkoutView.trailingAnchor, constant: -16),
            checkoutButton.bottomAnchor.constraint(equalTo: checkoutView.bottomAnchor, constant: -16),
            checkoutButton.widthAnchor.constraint(equalToConstant: 190),
            checkoutButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    override func configureviewModel() {
        viewModel.getCartItems()
        viewModel.sendState = { [weak self] state in
            guard let self else { return }
            switch state {
            case .success:
                collection.reloadData()
                navigationItem.title = "CART \(viewModel.items?.list?.count ?? 0)"
                totalPrice.text = "\(viewModel.items?.totalPrice ?? 0)$"
                refreshControl.endRefreshing()
            case .loading:
                loadingView.startAnimating()
            case .loaded:
                loadingView.stopAnimating()
                refreshControl.endRefreshing()
            case .error(message: let message):
                showAlert(message: message)
                refreshControl.endRefreshing()
            case .idle:
                break
            }
        }
    }
    
    @objc private func refreshData() {
        viewModel.resetProducts()
        collection.reloadData()
        viewModel.getCartItems()
    }
    
    @objc private func goToCheckout() {
    }
}


extension CartController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CartCell.self)", for: indexPath) as! CartCell
        if let productItem = viewModel.items?.list?[indexPath.row] {
            cell.configureCell(product: productItem)
            
            cell.countChange = { [weak self] in
                guard let self else { return }
                let item = viewModel.items?.list?[indexPath.row]
                let params: [String: [String: Any]] = [
                    "list": [
                        "productId": item?.productId?.id ?? "",
                        "variantId": item?.variantId ?? "",
                        "count": 1
                    ]
                ]
                viewModel.sendCartData(params: params)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 120)
    }
}
