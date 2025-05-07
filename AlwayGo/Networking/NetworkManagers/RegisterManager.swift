//
//  RegisterManager.swift
//  AlwayGo
//
//  Created by Mac on 20.04.25.
//

import Foundation

final class RegisterManager: AuthenticationManagerUseCase {
    func getRegisterData<T: Codable>(params: [String: Any], model: T.Type, completion: @escaping (T?, String?) -> Void) {
        let url = NetworkHelper.shared.configureURL(with: "/auth/register")
        NetworkManager.shared.sendRequest(url: url, method: .post, encoding: .json, params: params, model: model.self, completion: completion)
    }
}
