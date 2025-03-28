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
    
    private lazy var suggestionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var firstSuggestion: BoardSuggestionNameView = {
        let view = BoardSuggestionNameView()
        view.configureLabel(suggestName: "Ramadan & Eid  🎉")
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstsuggestionView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondSuggestion: BoardSuggestionNameView = {
        let view = BoardSuggestionNameView()
        view.configureLabel(suggestName: "Home Sweet Home  🏠")
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondSuggestionView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var thirdSuggestion: BoardSuggestionNameView = {
        let view = BoardSuggestionNameView()
        view.configureLabel(suggestName: "Make up  💄")
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var thirdSuggestionView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fourthSuggestion: BoardSuggestionNameView = {
        let view = BoardSuggestionNameView()
        view.configureLabel(suggestName: "Accessories  💍")
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var table: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

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
        [titleLabel, boardNameTextField, boardNameTextFieldView, suggestLabel].forEach({ addSubview($0) })
        [firstSuggestion, firstsuggestionView, secondSuggestion, secondSuggestionView, thirdSuggestion, thirdSuggestionView, fourthSuggestion].forEach { addSubview($0) }
        
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
            
            firstSuggestion.topAnchor.constraint(equalTo: suggestLabel.bottomAnchor, constant: 4),
            firstSuggestion.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstSuggestion.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            firstsuggestionView.topAnchor.constraint(equalTo: firstSuggestion.bottomAnchor, constant: 4),
            firstsuggestionView.leadingAnchor.constraint(equalTo: firstSuggestion.leadingAnchor),
            firstsuggestionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            secondSuggestion.topAnchor.constraint(equalTo: firstsuggestionView.bottomAnchor, constant: 2),
            secondSuggestion.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            secondSuggestion.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            secondSuggestionView.topAnchor.constraint(equalTo: secondSuggestion.bottomAnchor, constant: 4),
            secondSuggestionView.leadingAnchor.constraint(equalTo: secondSuggestion.leadingAnchor),
            secondSuggestionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            thirdSuggestion.topAnchor.constraint(equalTo: secondSuggestionView.bottomAnchor, constant: 2),
            thirdSuggestion.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            thirdSuggestion.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            thirdSuggestionView.topAnchor.constraint(equalTo: thirdSuggestion.bottomAnchor, constant: 4),
            thirdSuggestionView.leadingAnchor.constraint(equalTo: thirdSuggestion.leadingAnchor),
            thirdSuggestionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            fourthSuggestion.topAnchor.constraint(equalTo: thirdSuggestionView.bottomAnchor, constant: 2),
            fourthSuggestion.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            fourthSuggestion.trailingAnchor.constraint(equalTo: trailingAnchor),
            fourthSuggestion.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            firstSuggestion.heightAnchor.constraint(equalToConstant: 48),
            secondSuggestion.heightAnchor.constraint(equalToConstant: 48),
            thirdSuggestion.heightAnchor.constraint(equalToConstant: 48),
            fourthSuggestion.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}

extension BoardCreationView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
