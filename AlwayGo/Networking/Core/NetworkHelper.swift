//
//  NetworkHelper.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 09.03.25.
//

import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()
    private let baseURL = "https://eccomerce-mongoose.vercel.app/api"
    
    func configureURL(with url: String) -> String {
        return baseURL + url
    }
}
