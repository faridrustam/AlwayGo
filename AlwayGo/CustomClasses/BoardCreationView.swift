//
//  CreateBoard.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 23.03.25.
//

import UIKit

class BoardCreationView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "BOARD NAME"
        label.font = UIFont(name: "SFProText-Semibold", size: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var boardNameTextField: UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(string: "Enter a name for this board...", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.38)])
        field.borderStyle = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var boardNameTextFieldView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var suggestLabel: UILabel = {
        let label = UILabel()
        label.text = "Suggested names:"
        label.font = UIFont(name: "SFProText-Regular", size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var table: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NameSuggestionCell.self, forCellReuseIdentifier: "\(NameSuggestionCell.self)")
        return tableView
    }()
    
    let suggestedNames: [String] = ["Ramadan & Eid  🎉", "Home Sweet Home  🏠", "Make up  💄", "Accessories  💍"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
    }
    
    private func configureConstraints() {
        [titleLabel, boardNameTextField, boardNameTextFieldView, suggestLabel, table].forEach({ addSubview($0) })
        
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            boardNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            boardNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            boardNameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            boardNameTextFieldView.topAnchor.constraint(equalTo: boardNameTextField.bottomAnchor),
            boardNameTextFieldView.leadingAnchor.constraint(equalTo: boardNameTextField.leadingAnchor),
            boardNameTextFieldView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            suggestLabel.topAnchor.constraint(equalTo: boardNameTextFieldView.bottomAnchor, constant: 24),
            suggestLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            suggestLabel.heightAnchor.constraint(equalToConstant: 20),
            
            table.topAnchor.constraint(equalTo: suggestLabel.bottomAnchor, constant: 8),
            table.leadingAnchor.constraint(equalTo: suggestLabel.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: trailingAnchor),
            table.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension BoardCreationView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestedNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NameSuggestionCell.self)", for: indexPath) as! NameSuggestionCell
        cell.configureLabel(suggestName: suggestedNames[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        boardNameTextField.text = suggestedNames[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
