//
//  ProductController.swift
//  AlwayGo
//
//  Created by Mac on 17.03.25.
//

import UIKit

class ProductController: BaseController {
    private lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.register(ProductColorCell.self, forCellReuseIdentifier: "\(ProductColorCell.self)")
        table.register(ProductSizeCell.self, forCellReuseIdentifier: "\(ProductSizeCell.self)")
        table.register(ProductInfoCell.self, forCellReuseIdentifier: "\(ProductInfoCell.self)")
        table.register(ProductCell.self, forCellReuseIdentifier: "\(ProductCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private lazy var productPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "\(viewModel.price) ₼"
        label.font = .customFont(.sfProSemibold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shippingLabel: UILabel = {
        let label = UILabel()
        label.text = "Free shipping"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.font = .customFont(.sfProRegular, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Checkout", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 169/255, green: 184/255, blue: 202/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var addBagButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add bag", for: .normal)
        button.titleLabel?.font = .customFont(.sfProSemibold, size: 16)
        button.backgroundColor = .app
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(addBagButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .medium)
        loadingView.tintColor = .blue
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()
    
    private let viewModel: ProductViewModel
    
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func addBagButtonTapped() {
        let params: [String: [String: Any]] = [
            "list": [
                "productId": viewModel.productData?.id ?? "",
                "variantId": viewModel.productData?.variants?.first?.id ?? "",
                "count": 1
            ]
        ]
        viewModel.sendCartData(params: params)
    }
    
    func configurePrice(with price: String) {
        productPrice.text = price
    }
    
    private func configureTableHeader() {
        let header = ProductHeader(frame: .init(x: 0, y: 0, width: table.frame.width, height: 538))
        table.tableHeaderView = header
        header.presentShare = { [weak self] share in
            guard let self else { return }
            present(share, animated: true)
        }
        guard let variant = viewModel.productData?.variants else { return }
        header.configureImage(with: variant, and: viewModel.productData?.title ?? "")
        header.id = viewModel.productData?.id
    }
    
    override func configureUI() {
        loadingView.startAnimating()
        let topBorder = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 1))
        topBorder.backgroundColor = UIColor.systemGray5
        bottomView.addSubview(topBorder)
        navigationController?.navigationBar.isHidden = false
        let backButton = UIImage(named: "ProductBackButton")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        view.backgroundColor = .white
    }
    
    override func configureConstraints() {
        view.addSubViews(table, bottomView, loadingView)
        bottomView.addSubViews(productPrice, shippingLabel, checkoutButton, addBagButton)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: -48),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -20),
            
            productPrice.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            productPrice.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20),
            
            shippingLabel.leadingAnchor.constraint(equalTo: productPrice.leadingAnchor),
            shippingLabel.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 4),
            
            checkoutButton.widthAnchor.constraint(equalToConstant: 124),
            checkoutButton.heightAnchor.constraint(equalToConstant: 48),
            checkoutButton.leadingAnchor.constraint(equalTo: shippingLabel.trailingAnchor, constant: 16),
            checkoutButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20),
            
            addBagButton.widthAnchor.constraint(equalToConstant: 140),
            addBagButton.heightAnchor.constraint(equalToConstant: 48),
            addBagButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            addBagButton.centerYAnchor.constraint(equalTo: checkoutButton.centerYAnchor),
            
            
            bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 66),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func configureviewModel() {
        viewModel.getProductDetail()
        viewModel.sendState = { [weak self] state in
            guard let self else { return }
            switch state {
            case .success:
                table.reloadData()
            case .loading:
                loadingView.startAnimating()
            case .loaded:
                loadingView.stopAnimating()
                configureTableHeader()
            case .error(message: let message):
                showAlert(message: message)
            case .idle:
                break
            }
        }
    }
}

extension ProductController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = viewModel.model[section]
        return model.isOpened ? (model.cellInfo?.count ?? 0) : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = viewModel.model[indexPath.section].cellName
        
        switch cellName {
        case .color:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductColorCell.self)") as! ProductColorCell
            guard let value = viewModel.productData?.specs?[1].values else { return cell }
            cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            cell.selectionStyle = .none
            cell.configureCell(with: value[indexPath.row].key ?? "",
                               and: value)
            cell.selectedCell = {}
            return cell
        case .size:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductSizeCell.self)") as! ProductSizeCell
            guard let values = viewModel.productData?.specs?[indexPath.row].values else { return cell }
            cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            cell.selectionStyle = .none
            cell.configureArray(with: values)
            cell.selectedCell = {}
            return cell
            
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductInfoCell.self)") as! ProductInfoCell
            cell.separatorInset = .init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            cell.selectionStyle = .none
            cell.configureInfo(with: viewModel.productData?.description ?? "")
            return cell
            
        case .expandable(let type):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductCell.self)") as! ProductCell
            cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            switch type {
            case .features:
                cell.configureCell(with: viewModel.model[indexPath.section].cellInfo?[indexPath.row] ?? "")
            case .reviews:
                cell.configureCell(with: viewModel.model[indexPath.section].cellInfo?[indexPath.row] ?? "")
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section >= 3 {
            tableView.deselectRow(at: indexPath, animated: true)
            viewModel.model[indexPath.section].isOpened = !viewModel.model[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellTypes = viewModel.model[indexPath.section].cellName
        
        switch cellTypes {
        case .color:
            return 160
        case .info:
            return UITableView.automaticDimension
        case .size:
            return 100
        case .expandable:
            return 56
        }
    }
}


