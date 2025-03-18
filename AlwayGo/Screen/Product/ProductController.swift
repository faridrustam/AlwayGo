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
        view.addSubview(table)
        view.backgroundColor = .white
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

#Preview {
    ProductController()
}
