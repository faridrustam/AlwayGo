//
//  SignUpController.swift
//  AlwayGo
//
//  Created by Mac on 11.03.25.
//

import UIKit

class SignUpController: BaseController {
    var isTermsButtonSelected = false
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont(name: "SFProText-Semibold", size: 38)
        label.textColor = UIColor(named: "AppColor")
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
    
    private lazy var usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.borderStyle = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var usernameView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.borderStyle = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var emailView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.borderStyle = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var passwordView: UserFieldsView = {
        let view = UserFieldsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var hidePasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.imageView?.image?.withRenderingMode(.alwaysTemplate)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(hidePasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "At least 8 characters, with 1 number and 1 lowercase letter (no spaces allowed)"
        label.font = UIFont(name: "PlusJakartaSans-Regular", size: 12)
        label.numberOfLines = 0
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var termsButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var termsLabel: UILabel = {
        let label = UILabel()
        label.text = "I accept the Terms and privacy policy"
        label.font = UIFont(name: "SFProText-Medium", size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 16)
        button.backgroundColor = .app
        button.layer.borderWidth = 0.1
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var leftOrView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = UIFont(name: "SFProText-Regular", size: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightOrView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var signUpButtonStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var facebookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 0.4
        button.layer.borderColor = UIColor.lightGray.cgColor
        let image = UIImage(named: "FacebookLogo")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 0.4
        button.layer.borderColor = UIColor.lightGray.cgColor
        let image = UIImage(named: "GoogleLogo")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var appleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 0.4
        button.layer.borderColor = UIColor.lightGray.cgColor
        let image = UIImage(named: "AppleLogo")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var alreadyLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.font = UIFont(name: "SFProText-Regular", size: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 14)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var triangleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Triangle")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func hidePasswordButtonTapped(_ sender: UIButton) {
        if !isTermsButtonSelected {
            hidePasswordButton.setImage(UIImage(named: "eye.slash"), for: .normal)
            passwordField.isSecureTextEntry = true
        } else {
            hidePasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordField.isSecureTextEntry = false
        }
        sender.isSelected = !sender.isSelected
        isTermsButtonSelected = sender.isSelected
    }
    
    @objc func loginButtonTapped() {
        let coordinator = LoginCoordinator(navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
    
    @objc func termsButtonTapped(_ sender: UIButton) {
        if !isTermsButtonSelected {
            termsButton.layer.borderWidth = 3
            termsButton.backgroundColor = .black
            termsButton.setImage(UIImage(named: "DoneImage"), for: .normal)
        } else {
            termsButton.layer.borderWidth = 2
            termsButton.backgroundColor = .white
            termsButton.setImage(UIImage(named: ""), for: .normal)
        }
        sender.isSelected = !sender.isSelected
        isTermsButtonSelected = sender.isSelected
    }
    
    @objc func createButtonTapped() {
        if termsButton.isSelected {
            
        }
    }
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        [signUpLabel, textFieldsStack, conditionLabel, termsButton, termsLabel, createAccountButton, signUpButtonStack, alreadyLabel, loginButton, triangleImage, leftOrView, orLabel, rightOrView].forEach({ view.addSubview($0) })
        [usernameField, usernameView, emailField, emailView, passwordField, passwordView].forEach({ textFieldsStack.addArrangedSubview($0) })
        passwordField.addSubview(hidePasswordButton)
        [facebookButton, googleButton, appleButton].forEach({ signUpButtonStack.addArrangedSubview($0) })
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            signUpLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            textFieldsStack.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 36),
            textFieldsStack.leadingAnchor.constraint(equalTo: signUpLabel.leadingAnchor),
            textFieldsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            hidePasswordButton.widthAnchor.constraint(equalToConstant: 24),
            hidePasswordButton.heightAnchor.constraint(equalToConstant: 24),
            hidePasswordButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor, constant: 0),
            hidePasswordButton.centerYAnchor.constraint(equalTo: passwordField.centerYAnchor),
            
            conditionLabel.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 16),
            conditionLabel.leadingAnchor.constraint(equalTo: textFieldsStack.leadingAnchor),
            conditionLabel.trailingAnchor.constraint(equalTo: textFieldsStack.trailingAnchor),
            
            termsButton.widthAnchor.constraint(equalToConstant: 24),
            termsButton.heightAnchor.constraint(equalToConstant: 24),
            termsButton.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor, constant: 16),
            termsButton.leadingAnchor.constraint(equalTo: conditionLabel.leadingAnchor),
            
            termsLabel.leadingAnchor.constraint(equalTo: termsButton.trailingAnchor, constant: 12),
            termsLabel.centerYAnchor.constraint(equalTo: termsButton.centerYAnchor),
            
            createAccountButton.heightAnchor.constraint(equalToConstant: 56),
            createAccountButton.topAnchor.constraint(equalTo: termsLabel.bottomAnchor, constant: 36),
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            leftOrView.widthAnchor.constraint(equalToConstant: 123),
            leftOrView.heightAnchor.constraint(equalToConstant: 1),
            leftOrView.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 24),
            leftOrView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            
            orLabel.centerYAnchor.constraint(equalTo: leftOrView.centerYAnchor),
            orLabel.leadingAnchor.constraint(equalTo: leftOrView.trailingAnchor, constant: 20),
            
            rightOrView.widthAnchor.constraint(equalToConstant: 123),
            rightOrView.heightAnchor.constraint(equalToConstant: 1),
            rightOrView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            rightOrView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52),
            
            signUpButtonStack.heightAnchor.constraint(equalToConstant: 40),
            signUpButtonStack.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 16),
            signUpButtonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
            signUpButtonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),
            
            alreadyLabel.topAnchor.constraint(equalTo: signUpButtonStack.bottomAnchor, constant: 16),
            alreadyLabel.leadingAnchor.constraint(equalTo: signUpButtonStack.leadingAnchor, constant: 44),
            
            loginButton.centerYAnchor.constraint(equalTo: alreadyLabel.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: alreadyLabel.trailingAnchor, constant: 8),
            
            triangleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            triangleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    override func configureviewModel() {
        print("")
    }
}
