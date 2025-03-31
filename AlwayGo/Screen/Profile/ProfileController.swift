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
        let footerView = UIView(frame: .init(x: 0, y: 0, width: table.frame.width, height: 25))
        table.tableFooterView = footerView
        table.delegate = self
        table.dataSource = self
        table.register(ProfileButtonsCell.self, forCellReuseIdentifier: "\(ProfileButtonsCell.self)")
        table.register(ProfileSectionsCell.self, forCellReuseIdentifier: "\(ProfileSectionsCell.self)")
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
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else if section == 1 {
            return 32
        }
        return 16
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = viewModel.model[section].cell
        if case .buttons = sectionType {
            return 1
        }
        return viewModel.model[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.model[indexPath.section]
        let cellType = section.cell
        
        switch cellType {
        case .buttons:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileButtonsCell.self)") as! ProfileButtonsCell
            cell.separatorInset = .init(top: 16, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        case .sections:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileSectionsCell.self)") as! ProfileSectionsCell
            cell.configureCell(with: section.rows[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cells = viewModel.cells[indexPath.section]
        
        switch cells {
        case .buttons:
            return 90
        case .sections:
            return 56
        }
    }
}

#Preview {
    ProfileController()
}
