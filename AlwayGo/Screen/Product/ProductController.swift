//
//  ProductController.swift
//  AlwayGo
//
//  Created by Mac on 17.03.25.
//

import UIKit

class ProductController: BaseController {
    let viewModel = ProductViewModel()
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.register(ProductColorCell.self, forCellReuseIdentifier: "\(ProductColorCell.self)")
        table.register(ProductSizeCell.self, forCellReuseIdentifier: "\(ProductSizeCell.self)")
        table.register(ProductInfoCell.self, forCellReuseIdentifier: "\(ProductInfoCell.self)")
        table.register(ProductCell.self, forCellReuseIdentifier: "\(ProductCell.self)")
        let header = ProductHeader(frame: .init(x: 0, y: 0, width: table.frame.width, height: 538))
        table.tableHeaderView = header
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price:"
        label.textColor = .black
        label.font = UIFont(name: "SFProText-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productPrice: UILabel = {
        let label = UILabel()
        label.text = "$149.00"
        label.textColor = .black
        label.font = UIFont(name: "SFProText-Semibold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 16)
        button.backgroundColor = .app
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 31
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        let topBorder = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 1))
        topBorder.backgroundColor = UIColor.systemGray5
        bottomView.addSubview(topBorder)
        navigationController?.navigationBar.isHidden = false
        let backButton = UIImage(named: "ProductBackButton")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        view.backgroundColor = .white
        view.addSubViews(table, bottomView)
        bottomView.addSubViews(priceLabel, productPrice, addToCartButton)
        
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: -48),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -20),
            
            priceLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            priceLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -20),
            
            productPrice.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            productPrice.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 16),
            
            addToCartButton.widthAnchor.constraint(equalToConstant: 177),
            addToCartButton.heightAnchor.constraint(equalToConstant: 56),
            addToCartButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            addToCartButton.centerYAnchor.constraint(equalTo: productPrice.centerYAnchor),
            
            bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 78),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
            cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            cell.selectionStyle = .none
            return cell
        case .size:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductSizeCell.self)") as! ProductSizeCell
            cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            cell.selectionStyle = .none
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductInfoCell.self)") as! ProductInfoCell
            cell.separatorInset = .init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            cell.selectionStyle = .none
            return cell
            
        case .expandable(let type):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductCell.self)") as! ProductCell
            cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            switch type {
            case .features:
                cell.configureCell(with: viewModel.model[indexPath.section].cellInfo?[indexPath.row] ?? "")
            case .reviews:
                cell.configureCell(with: viewModel.model[indexPath.section].cellInfo?[indexPath.row] ?? "")
            case .overviewAndVideos:
                cell.configureCell(with: viewModel.model[indexPath.section].cellInfo?[indexPath.row] ?? "")
            case .photos:
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
            return 80
        case .info:
            return UITableView.automaticDimension
        case .expandable, .size:
            return 56
        }
    }
}

#Preview {
    ProductController()
}
