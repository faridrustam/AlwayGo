//
//  CartController.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class CartController: BaseController {
    private lazy var selectionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var selectAllLabel: UILabel = {
        let label = UILabel()
        label.text = "Select all"
        label.font = .customFont(.sfProRegular, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureUI() {
        navigationItem.title = "Cart"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.customFont(.sfProSemibold, size: 16),
                                                                   .foregroundColor: UIColor.black]
    }
    
    override func configureConstraints() {
        view.addSubViews(selectionButton, selectAllLabel)
        NSLayoutConstraint.activate([
            selectionButton.widthAnchor.constraint(equalToConstant: 24),
            selectionButton.heightAnchor.constraint(equalToConstant: 24),
            selectionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            selectionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}


#Preview {
    CartController()
}
