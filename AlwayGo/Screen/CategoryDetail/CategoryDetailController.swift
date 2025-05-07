//
//  CategoryDetailController.swift
//  AlwayGo
//
//  Created by Mac on 01.04.25.
//

import UIKit

class CategoryDetailController: BaseController {
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.backgroundImage = UIImage()
        search.delegate = self
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(CategoryDetailCell.self, forCellReuseIdentifier: "\(CategoryDetailCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let viewModel: CategoryDetailViewModel
    private var tableTopAnchor: NSLayoutConstraint?
    
    init(viewModel: CategoryDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let backButtonTitle = UIBarButtonItem()
        backButtonTitle.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButtonTitle
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.customFont(.sfProSemibold, size: 16),
                                                                   .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)]
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        tableTopAnchor = table.topAnchor.constraint(equalTo: view.topAnchor, constant: 24)
        tableTopAnchor?.isActive = true
    }
    
    override func configureviewModel() {
        
    }
    
    @objc func magnifierButtonTapped(_ sender: UIButton) {
        tableTopAnchor?.isActive = false
        if !sender.isSelected {
            navigationItem.rightBarButtonItem?.tintColor = .clear
            tableTopAnchor = table.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 24)
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self else { return }
                view.addSubview(searchBar)
                tableTopAnchor?.isActive = true
                handleSearchLayout()
                view.layoutIfNeeded()
            }
        } else {
            tableTopAnchor = table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24)
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self else { return }
                searchBar.removeFromSuperview()
                tableTopAnchor?.isActive = true
                view.layoutIfNeeded()
            }
        }
        sender.isSelected = !sender.isSelected
    }
    
    private func handleSearchLayout() {
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }
}

extension CategoryDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categoryModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CategoryDetailCell.self)") as! CategoryDetailCell
        cell.configureCell(with: viewModel.categoryModel[indexPath.row])
        cell.hideButtons(with: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coordinator = CategoryFlowCoordinator(navigationController: navigationController ?? UINavigationController(),
                                                  title: viewModel.cells[indexPath.row])
        coordinator.showProduct()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension CategoryDetailController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            viewModel.categoryModel = viewModel.allCategories.filter { $0.name?.lowercased().contains(searchText.lowercased()) ?? false }
        } else {
            viewModel.categoryModel = viewModel.allCategories
            searchBar.resignFirstResponder()
        }
        table.reloadData()
    }
}
