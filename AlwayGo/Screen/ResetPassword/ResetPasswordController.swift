//
//  ResetPasswordController.swift
//  AlwayGo
//
//  Created by Mac on 18.04.25.
//

import UIKit

class ResetPasswordController: BaseController {
    let viewModel = ResetPasswordViewModel()
    
    private lazy var resetPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Reset Password"
        label.font = .customFont(.sfProSemibold, size: 28)
        label.textColor = .app
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the mail address you used when you joined and we’ll send you instructions to reset your password."
        label.numberOfLines = 3
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 60)
        label.font = .customFont(.sfProRegular, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter your email address"
        field.leftView = UIView(frame: .init(x: 0, y: 0, width: 16, height: 0))
        field.leftViewMode = .always
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 90).cgColor
        field.layer.cornerRadius = 12
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var emailImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LoginEmailImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var resetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset password", for: .normal)
        button.titleLabel?.font = .customFont(.sfProSemibold, size: 16)
        button.backgroundColor = .app
        button.layer.borderWidth = 0.1
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var rememberPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "You remember your password?"
        label.font = .customFont(.sfProRegular, size: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .customFont(.sfProSemibold, size: 14)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func resetPasswordButtonTapped() {
        if let text = emailField.text, !text.isEmpty, isValidEmailComplex(text) {
            viewModel.getForgetPasswordData(with: text)
        } else {
            showAlert()
        }
    }
    
    @objc func loginButtonTapped() {
        
    }
    
    private func isValidEmailComplex(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.backgroundColor = .white
        let backButton = UIImage(named: "LoginBackButton")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        let backItemTitle = UIBarButtonItem()
        backItemTitle.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backItemTitle
    }
    
    override func configureConstraints() {
        view.addSubViews(resetPasswordLabel, enterLabel, emailField, resetPasswordButton, bottomStack)
        resetPasswordButton.addSubview(emailImage)
        bottomStack.addArrangedSubViews(rememberPasswordLabel, loginButton)
        NSLayoutConstraint.activate([
            resetPasswordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            resetPasswordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            resetPasswordLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            enterLabel.topAnchor.constraint(equalTo: resetPasswordLabel.bottomAnchor, constant: 8),
            enterLabel.leadingAnchor.constraint(equalTo: resetPasswordLabel.leadingAnchor),
            enterLabel.trailingAnchor.constraint(equalTo: resetPasswordLabel.trailingAnchor),
            
            emailField.heightAnchor.constraint(equalToConstant: 64),
            emailField.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: 32),
            emailField.leadingAnchor.constraint(equalTo: enterLabel.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: enterLabel.trailingAnchor),
            
            emailImage.widthAnchor.constraint(equalToConstant: 24),
            emailImage.heightAnchor.constraint(equalToConstant: 24),
            emailImage.trailingAnchor.constraint(equalTo: emailField.trailingAnchor, constant: -20),
            emailImage.centerYAnchor.constraint(equalTo: emailField.centerYAnchor),
            
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 56),
            resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 36),
            resetPasswordButton.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            resetPasswordButton.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            
            bottomStack.topAnchor.constraint(equalTo: resetPasswordButton.bottomAnchor, constant: 16),
            bottomStack.centerXAnchor.constraint(equalTo: resetPasswordButton.centerXAnchor)
        ])
    }
    
    override func configureviewModel() {
        viewModel.success = {
            print("Success")
        }
        viewModel.errorMessage = { error in
            print("Error happened. \(error)")
        }
    }
}
