//
//  ResetPasswordViewModel.swift
//  AlwayGo
//
//  Created by Mac on 21.04.25.
//

import Foundation

class ResetPasswordViewModel {
    let manager = ResetPasswordManager()
    var model: ForgetPasswordModel?
    var success: (() -> Void)?
    var errorMessage: ((String) -> Void)?
    
    func getForgetPasswordData(with email: String) {
        let params: [String: Any] = [
            "email": email
        ]
        
        manager.getRegisterData(params: params, model: ForgetPasswordModel.self) { [weak self] data, error in
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
