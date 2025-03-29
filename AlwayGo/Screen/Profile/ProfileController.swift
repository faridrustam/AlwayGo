//
//  ProfileController.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class ProfileController: BaseController {
    let viewModel = ProfileViewModel()
    
    private lazy var profileView: ProfileUserView = {
        let view = ProfileUserView(frame: .init(x: 0, y: 0, width: 370, height: 220))
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(red: 0.928, green: 0.928, blue: 0.928, alpha: 1)
        table.tableHeaderView = profileView
        table.delegate = self
        table.dataSource = self
        table.register(ProfileButtonsCell.self, forCellReuseIdentifier: "\(ProfileButtonsCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureUI() {
        view.layer.backgroundColor = UIColor(red: 0.928, green: 0.928, blue: 0.928, alpha: 1).cgColor
        view.addSubViews(table)
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            profileView.widthAnchor.constraint(equalToConstant: 370),
            profileView.heightAnchor.constraint(equalToConstant: 220),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = viewModel.cells[indexPath.row]
        
        switch cells {
        case .buttons:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileButtonsCell.self)") as! ProfileButtonsCell
            cell.separatorInset = .init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

#Preview {
    ProfileController()
}
