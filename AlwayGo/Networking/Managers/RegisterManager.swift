//
//  RegisterManager.swift
//  AlwayGo
//
//  Created by Mac on 20.04.25.
//

import Foundation

class RegisterManager: AuthenticationManagerUseCase {
    let networkManager = NetworkManager()
    
    func getRegisterData<T: Codable>(params: [String: Any], model: T.Type, completion: @escaping (T?, String?) -> Void) {
        let url = NetworkHelper.shared.configureURL(with: "/auth/register")
        networkManager.sendRequest(url: url, method: .post, encoding: .json, params: params, model: model.self, completion: completion)
    }
}
