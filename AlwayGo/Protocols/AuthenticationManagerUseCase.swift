//
//  AuthenticationManagerUseCase.swift
//  AlwayGo
//
//  Created by Mac on 21.04.25.
//

import Foundation

protocol AuthenticationManagerUseCase {
    func getRegisterData<T: Codable>(params: [String: Any], model: T.Type, completion: @escaping ((T?, String?) -> Void))
}
