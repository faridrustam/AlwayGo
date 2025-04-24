//
//  SetNewPasswordController.swift
//  AlwayGo
//
//  Created by Mac on 22.04.25.
//

import UIKit

class SetNewPasswordController: BaseController {
    var isButtonSelected = false
    
    private lazy var setNewPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Set a new password"
        label.font = .customFont(.sfProSemibold, size: 28)
        label.textColor = .app
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var createLabel: UILabel = {
        let label = UILabel()
        label.text = "Create a new password. Ensure it differs from previous ones for security"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = .customFont(.sfProRegular, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textFieldsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 18
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var newPasswordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter your new password"
        field.rightView = hideNewPasswordButton
        field.rightViewMode = .always
        field.borderStyle = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var newPasswordView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var hideNewPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.imageView?.image?.withRenderingMode(.alwaysTemplate)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(hideNewPasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var confirmPasswordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Confirm password"
        field.rightView = hideConfirmPasswordButton
        field.rightViewMode = .always
        field.borderStyle = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var confirmPasswordView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var hideConfirmPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.imageView?.image?.withRenderingMode(.alwaysTemplate)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(hideConfirmPasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var updatePasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update password", for: .normal)
        button.titleLabel?.font = .customFont(.sfProSemibold, size: 16)
        button.backgroundColor = .app
        button.layer.borderWidth = 0.1
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(updatePasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func hideNewPasswordButtonTapped(_ sender: UIButton) {
        if !isButtonSelected {
            hideNewPasswordButton.setImage(UIImage(named: "eye.slash"), for: .normal)
            newPasswordField.isSecureTextEntry = true
        } else {
            hideNewPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
            newPasswordField.isSecureTextEntry = false
        }
        sender.isSelected = !sender.isSelected
        isButtonSelected = sender.isSelected
    }
    
    @objc func hideConfirmPasswordButtonTapped(_ sender: UIButton) {
        if !isButtonSelected {
            hideConfirmPasswordButton.setImage(UIImage(named: "eye.slash"), for: .normal)
            confirmPasswordField.isSecureTextEntry = true
        } else {
            hideConfirmPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
            confirmPasswordField.isSecureTextEntry = false
        }
        sender.isSelected = !sender.isSelected
        isButtonSelected = sender.isSelected
    }
    
    @objc func updatePasswordButtonTapped() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.backgroundColor = .white
        let backItemTitle = UIBarButtonItem()
        backItemTitle.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backItemTitle
    }
    
    override func configureConstraints() {
        view.addSubViews(setNewPasswordLabel, createLabel, textFieldsStack, updatePasswordButton)
        textFieldsStack.addArrangedSubViews(newPasswordField, newPasswordView, confirmPasswordField, confirmPasswordView)
        NSLayoutConstraint.activate([
            setNewPasswordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            setNewPasswordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setNewPasswordLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            createLabel.topAnchor.constraint(equalTo: setNewPasswordLabel.bottomAnchor, constant: 8),
            createLabel.leadingAnchor.constraint(equalTo: setNewPasswordLabel.leadingAnchor),
            createLabel.trailingAnchor.constraint(equalTo: setNewPasswordLabel.trailingAnchor),
            
            textFieldsStack.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 32),
            textFieldsStack.leadingAnchor.constraint(equalTo: createLabel.leadingAnchor),
            textFieldsStack.trailingAnchor.constraint(equalTo: createLabel.trailingAnchor),
            
            updatePasswordButton.heightAnchor.constraint(equalToConstant: 56),
            updatePasswordButton.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 36),
            updatePasswordButton.leadingAnchor.constraint(equalTo: textFieldsStack.leadingAnchor),
            updatePasswordButton.trailingAnchor.constraint(equalTo: textFieldsStack.trailingAnchor)
        ])
    }
}
