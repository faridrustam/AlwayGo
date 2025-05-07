//
//  NetworkManager.swift
//  AlwayGo
//
//  Created by Mac on 07.03.25.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func sendRequest<T: Codable>(url: String,
                                 method: HTTPMethod = .get,
                                 encoding: EncodingType = .url,
                                 params: Parameters? = nil,
                                 header: HTTPHeaders? = nil,
                                 model: T.Type,
                                 completion: @escaping ((T?, String?) -> Void)) {
        AF.request(url,
                   method: method,
                   parameters: params,
                   encoding: encoding == .url ? URLEncoding.default: JSONEncoding.default,
                   headers: header).responseDecodable(of: model.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

