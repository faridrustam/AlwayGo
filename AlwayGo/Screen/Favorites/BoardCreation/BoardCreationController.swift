//
//  CreateBoardController.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 23.03.25.
//

import UIKit

class BoardCreationController: BaseController {
    
    private lazy var customNavigationView: CustomPresentNavigationView = {
        let view = CustomPresentNavigationView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var boardView: BoardCreationView = {
        let view = BoardCreationView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create board", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Bold", size: 14)
        button.backgroundColor = UIColor.app
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureUI() {
        view.backgroundColor = .systemGray6
        
        customNavigationView.iconTapped = { [weak self] in
            guard let self else { return }
            dismiss(animated: true)
        }
    }
    
    override func configureConstraints() {
        view.addSubview(customNavigationView)
        view.addSubview(boardView)
        view.addSubview(createButton)
        
        NSLayoutConstraint.activate([
            customNavigationView.topAnchor.constraint(equalTo: view.topAnchor),
            customNavigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavigationView.heightAnchor.constraint(equalToConstant: 56),
            
            boardView.topAnchor.constraint(equalTo: customNavigationView.bottomAnchor, constant: 12),
            boardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            boardView.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -16),
            boardView.heightAnchor.constraint(equalToConstant: 350),

            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.heightAnchor.constraint(equalToConstant: 56),
            ])
    }
    
    override func configureviewModel() {
    }
    
    @objc private func createButtonTapped() {
        
    }

}
