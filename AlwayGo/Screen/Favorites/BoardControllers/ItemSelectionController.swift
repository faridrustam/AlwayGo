//
//  ItemSelectionController.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 30.03.25.
//

import UIKit

class ItemSelectionController: BaseController {
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(ItemSelectionCell.self, forCellReuseIdentifier: "\(ItemSelectionCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var customNavigationView: CustomPresentNavigationView = {
        let view = CustomPresentNavigationView()
        view.backgroundColor = .white
        view.configure(with: "SELECT ITEMS", iconName: "Skip")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func configureUI() {
        view.backgroundColor = .systemGray6
    }

    override func configureConstraints() {
        view.addSubViews(table, customNavigationView)
        
        NSLayoutConstraint.activate([
            customNavigationView.topAnchor.constraint(equalTo: view.topAnchor),
            customNavigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavigationView.heightAnchor.constraint(equalToConstant: 56),
            
            table.topAnchor.constraint(equalTo: customNavigationView.bottomAnchor, constant: 12),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    @objc func trigered() {
        
    }
}

extension ItemSelectionController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ItemSelectionCell.self)", for: indexPath) as! ItemSelectionCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("deselected")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
