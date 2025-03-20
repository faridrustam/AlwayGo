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
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        navigationController?.navigationBar.isHidden = false
        
        let backButton = UIImage(named: "ProductBackButton")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        view.backgroundColor = .white
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.register(ProductHeader.self, forHeaderFooterViewReuseIdentifier: "\(ProductHeader.self)")
        table.register(ProductCell.self, forCellReuseIdentifier: "\(ProductCell.self)")
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: -72),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ProductController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductCell.self)") as! ProductCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(ProductHeader.self)") as! ProductHeader
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        538
    }
}

#Preview {
    ProductController()
}
