//
//  ResetPasswordManager.swift
//  AlwayGo
//
//  Created by Mac on 21.04.25.
//

import Foundation

struct ForgetPasswordModel: Codable {
    let message: String?
}

class ResetPasswordManager: AuthenticationManagerUseCase {
    let manager = NetworkManager()
    
    func getRegisterData<T: Codable>(params: [String: Any], model: T.Type, completion: @escaping (T?, String?) -> Void) {
        let url = NetworkHelper.shared.configureURL(with: "/forget_password")
        manager.sendRequest(url: url, method: .post, encoding: .json, params: params, model: model.self, completion: completion)
    }
}
