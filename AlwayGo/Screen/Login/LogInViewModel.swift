//
//  LoginViewModel.swift
//  AlwayGo
//
//  Created by Mac on 12.03.25.
//

import Foundation

class LogInViewModel {
    let loginManager = LoginManager()
    private(set) var model: LoginModel?
    var success: (() -> Void)?
    var errorMessage: ((String) -> Void)?
    
    func getLoginData(with email: String, and password: String) {
        let params: [String: Any] = [
            "email": email,
            "password": password
        ]
        loginManager.getRegisterData(params: params, model: LoginModel.self) { [weak self] data, error in
            guard let self else { return }
            if let data {
                model = data
                print(data)
                UserDefaultsManager.shared.setValue(model?.user?.firstName ?? "", and: .username)
                success?()
            } else if let error {
                errorMessage?(error)
            }
        }
    }
}
