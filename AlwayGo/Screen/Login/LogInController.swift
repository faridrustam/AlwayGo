//
//  LoginController.swift
//  AlwayGo
//
//  Created by Mac on 12.03.25.
//

import UIKit

class LogInController: BaseController {
    var isTermsButtonSelected = false
    
    private lazy var logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in"
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
    
    private lazy var forgotLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Password?"
        label.font = UIFont(name: "SFProText-Medium", size: 14)
        label.numberOfLines = 0
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordButtonTapped))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 16)
        button.backgroundColor = .app
        button.layer.borderWidth = 0.1
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
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
        label.text = "Don't have an account?"
        label.font = UIFont(name: "SFProText-Regular", size: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 14)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
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
    
    override func configureUI() {
        view.backgroundColor = .white
        [logInLabel, textFieldsStack, forgotLabel, logInButton, signUpButtonStack, alreadyLabel, signUpButton, triangleImage, leftOrView, orLabel, rightOrView].forEach({ view.addSubview($0) })
        [usernameField, usernameView, passwordField, passwordView].forEach({ textFieldsStack.addArrangedSubview($0) })
        passwordField.addSubview(hidePasswordButton)
        [facebookButton, googleButton, appleButton].forEach({ signUpButtonStack.addArrangedSubview($0) })
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            logInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            logInLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            textFieldsStack.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 56),
            textFieldsStack.leadingAnchor.constraint(equalTo: logInLabel.leadingAnchor),
            textFieldsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            hidePasswordButton.widthAnchor.constraint(equalToConstant: 24),
            hidePasswordButton.heightAnchor.constraint(equalToConstant: 24),
            hidePasswordButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor, constant: 0),
            hidePasswordButton.centerYAnchor.constraint(equalTo: passwordField.centerYAnchor),
            
            forgotLabel.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 12),
            forgotLabel.trailingAnchor.constraint(equalTo: textFieldsStack.trailingAnchor),
            forgotLabel.widthAnchor.constraint(equalToConstant: 125),
            forgotLabel.heightAnchor.constraint(equalToConstant: 16),
            
            logInButton.heightAnchor.constraint(equalToConstant: 56),
            logInButton.topAnchor.constraint(equalTo: forgotLabel.bottomAnchor, constant: 36),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            leftOrView.widthAnchor.constraint(equalToConstant: 123),
            leftOrView.heightAnchor.constraint(equalToConstant: 1),
            leftOrView.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 24),
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
            
            signUpButton.centerYAnchor.constraint(equalTo: alreadyLabel.centerYAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: alreadyLabel.trailingAnchor, constant: 8),
            
            triangleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            triangleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    override func configureviewModel() {
        print("")
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
    
    @objc func signUpButtonTapped() {
        print("sign up button tapped")
    }
    
    @objc func signInButtonTapped() {
        print("sign in button tapped")
    }
    
    @objc func forgotPasswordButtonTapped() {
        print("forget password tapped")
    }
}
