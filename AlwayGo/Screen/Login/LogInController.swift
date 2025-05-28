//
//  LoginController.swift
//  AlwayGo
//
//  Created by Mac on 12.03.25.
//

import UIKit
import CoreML

class LogInController: BaseController {
    private lazy var logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in"
        label.font = .customFont(.sfProSemibold, size: 38)
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
    
    private lazy var emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.borderStyle = .none
        field.returnKeyType = .continue
        field.tag = 1
        field.delegate = self
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
        field.rightView = hidePasswordButton
        field.rightViewMode = .always
        field.borderStyle = .none
        field.isSecureTextEntry = true
        field.returnKeyType = .done
        field.tag = 2
        field.delegate = self
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
        button.setImage(UIImage(named: "eye.slash"), for: .normal)
        button.imageView?.image?.withRenderingMode(.alwaysTemplate)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(hidePasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var forgotLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Password?"
        label.font = .customFont(.sfProMedium, size: 14)
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
        button.titleLabel?.font = .customFont(.sfProSemibold, size: 16)
        button.backgroundColor = .app
        button.layer.borderWidth = 0.1
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
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
        label.font = .customFont(.sfProRegular, size: 12)
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
        label.font = .customFont(.sfProRegular, size: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .customFont(.sfProSemibold, size: 14)
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
    
    private lazy var littleTriangleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LittleTriangle")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let viewModel = LogInViewModel()
    var isTermsButtonSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubViews(
            logInLabel,
            textFieldsStack,
            forgotLabel,
            logInButton,
            signUpButtonStack,
            alreadyLabel,
            signUpButton,
            triangleImage,
            littleTriangleImage,
            leftOrView,
            orLabel,
            rightOrView
        )
        textFieldsStack.addArrangedSubViews(emailField, usernameView, passwordField, passwordView)
        signUpButtonStack.addArrangedSubViews(facebookButton, googleButton, appleButton)
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            logInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            logInLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            textFieldsStack.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 56),
            textFieldsStack.leadingAnchor.constraint(equalTo: logInLabel.leadingAnchor),
            textFieldsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
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
            littleTriangleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            littleTriangleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    override func configureviewModel() {
        viewModel.sendState = { [weak self] state in
            guard let self else { return }
            switch state {
            case .success:
                handleSuccessCase()
            case .error(message: let message):
                handleErrorCase()
            default:
                break
            }
        }
    }
    
    private func handleSuccessCase() {
        UserDefaultsManager.shared.setValue(true, and: .isLoggedIn)
        let controller = TabBarController()
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = window.delegate as? SceneDelegate else { return }
        sceneDelegate.window?.rootViewController = controller
    }
    
    private func handleErrorCase() {
        usernameView.backgroundColor = .red
        passwordView.backgroundColor = .red
        hidePasswordButton.tintColor = .red
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
        let controller = SignUpController()
        navigationController?.show(controller, sender: nil)
    }
    
    @objc func loginButtonTapped() {
        if let emailText = emailField.text, !emailText.isEmpty,
           let passwordText = passwordField.text, !passwordText.isEmpty {
            viewModel.getLoginData(with: emailText, and: passwordText)
            UserDefaultsManager.shared.setValue(emailText, and: .email)
            let status = KeychainManager.shared.savePassword(service: Bundle.main.bundlePath,
                                                             account: emailText,
                                                             password: passwordText)
            let data = KeychainManager.shared.getPassword(service: Bundle.main.bundlePath, account: emailText)
            KeychainManager.shared.saveEmail(email: emailText)
        }
    }
    
    @objc func forgotPasswordButtonTapped() {
        let coordinator = LogInCoordinator(navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
}

extension LogInController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let field = view.viewWithTag(textField.tag + 1) as? UITextField {
            field.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
