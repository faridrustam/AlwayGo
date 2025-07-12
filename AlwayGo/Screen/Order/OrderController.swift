//
//  OrderController.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 23.06.25.
//

import UIKit

class OrderController: BaseController {
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(OrderCell.self, forCellReuseIdentifier: "\(OrderCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .medium)
        loadingView.tintColor = .blue
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()
    
    let viewModel = OrderViewModel(orderManager: OrderManager())

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        loadingView.startAnimating()
        navigationItem.title = "Order \(viewModel.order?.count ?? 0)"
    }
    
    override func configureConstraints() {
        view.addSubViews(table, loadingView)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    override func configureviewModel() {
        viewModel.getOrder()
        viewModel.sendState = { [weak self] state in
            guard let self else { return }
            switch state {
            case .success:
                table.reloadData()
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

extension OrderController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.order?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(OrderCell.self)") as! OrderCell
        if let orderList = viewModel.order?[indexPath.row], let productList = orderList.list?[0] {
            cell.configureCell(amount: orderList.totalPrice ?? 0,
                               orderDate: orderList.createdAt ?? "",
                               product: productList)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 380
    }
}
