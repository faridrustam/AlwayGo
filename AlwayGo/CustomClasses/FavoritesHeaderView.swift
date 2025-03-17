//
//  FavoritesHeaderView.swift
//  AlwayGo
//
//  Created by Mac on 16.03.25.
//

import UIKit

class FavoritesHeaderView: UIView {
    private var selectedViewConstraints: NSLayoutConstraint?
    
    private lazy var labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 28
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var allItemsButton: UIButton = {
        let button = UIButton()
        button.setTitle("All Items", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 16)
        button.addTarget(self, action: #selector(allItemsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var boardsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Boards", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 16)
        button.addTarget(self, action: #selector(boardsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var selectedButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = .app
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func allItemsButtonTapped(_ sender: UIButton) {
        moveSelectedView(to: allItemsButton)
    }
    
    @objc func boardsButtonTapped(_ sender: UIButton) {
        moveSelectedView(to: boardsButton)
    }
    
    private func moveSelectedView(to button: UIButton) {
        selectedButtonView.isHidden = false
        selectedViewConstraints?.isActive = false
        selectedViewConstraints = selectedButtonView.leadingAnchor.constraint(equalTo: button.leadingAnchor)
        selectedViewConstraints?.isActive = true
    }
    
    private func configureUI() {
        [labelStack, selectedButtonView].forEach({ addSubview($0) })
        [allItemsButton, boardsButton].forEach({ labelStack.addArrangedSubview($0) })
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            labelStack.topAnchor.constraint(equalTo: topAnchor),
            labelStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            labelStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            labelStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            selectedButtonView.topAnchor.constraint(equalTo: allItemsButton.bottomAnchor),
            selectedButtonView.widthAnchor.constraint(equalToConstant: 152),
            selectedButtonView.heightAnchor.constraint(equalToConstant: 3),
        ])
        selectedViewConstraints = selectedButtonView.leadingAnchor.constraint(equalTo: allItemsButton.leadingAnchor)
        selectedViewConstraints?.isActive = true
    }
}

#Preview {
    FavoritesHeaderView()
}
