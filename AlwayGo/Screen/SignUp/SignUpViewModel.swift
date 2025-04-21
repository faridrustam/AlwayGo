//
//  SignUpViewModel.swift
//  AlwayGo
//
//  Created by Mac on 11.03.25.
//

import Foundation

class SignUpViewModel {
    let registerManager = RegisterManager()
    var model: RegisterModel?
    var success: (() -> Void)?
    var errorMessage: ((String) -> Void)?
    
    func getRegisterData(firstName: String, lastName: String, email: String, password: String) {
        let registerData: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password
        ]
        
        registerManager.getRegisterData(params: registerData, model: RegisterModel.self) { [weak self] data, error in
            guard let self else { return }
            if let data {
                model = data
                success?()
            } else if let error {
                errorMessage?(error)
            }
        }
    }
}
