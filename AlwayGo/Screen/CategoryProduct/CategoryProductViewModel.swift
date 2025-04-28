//
//  CategoryProductViewModel.swift
//  AlwayGo
//
//  Created by Mac on 13.04.25.
//

import Foundation

class CategoryProductViewModel {
    
    func getURL() -> URL {
        guard let url = URL(string: "https://proper-clone-six.vercel.app/detail/the-non-iron-stretch-shirt/s-green-and-navy-multicheck") else { return URL(string: "")! }
        return url
    }
}
