//
//  NetworkHelper.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 09.03.25.
//

import Foundation
import Alamofire

enum EncodingType {
    case url
    case json
}

final class NetworkHelper {
    static let shared = NetworkHelper()
    private init() {}
    private let baseURL = "https://eccomerce-mongoose.vercel.app/api"
//    private let email = KeychainManager.shared.getSavedEmailAccount() ?? ""
    let header: HTTPHeaders = ["Authorization": "Bearer \(KeychainManager.shared.readToken(account: KeychainManager.shared.getSavedEmailAccount() ?? "") ?? "")"]

    func configureURL(with url: String) -> String {
        return baseURL + url
    }
}
