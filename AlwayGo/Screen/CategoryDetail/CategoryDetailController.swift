//
//  CategoryDetailController.swift
//  AlwayGo
//
//  Created by Mac on 01.04.25.
//

import UIKit

class CategoryDetailController: BaseController {
    let viewModel = CategoryDetailViewModel()
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(CategoryDetailCell.self, forCellReuseIdentifier: "\(CategoryDetailCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func magnifierButtonTapped() {
        
    }
    
    override func configureUI() {
        view.addSubview(table)
        view.backgroundColor = .white
        let backButton = UIImage(named: "CategoryDetailBackButton")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftMagnifier"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(magnifierButtonTapped))
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.customFont(.sfProSemibold, size: 16),
                                                                   .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)]
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension CategoryDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CategoryDetailCell.self)") as! CategoryDetailCell
        cell.configureCell(with: viewModel.cells[indexPath.row])
        cell.hideButtons(with: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coordinator = CategoryFlowCoordinator(navigationController: navigationController ?? UINavigationController() , title: viewModel.cells[indexPath.row])
        coordinator.showProduct()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

#Preview {
    CategoryDetailController()
}
