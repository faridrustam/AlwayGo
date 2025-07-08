//
//  FileManagerHelper.swift
//  AlwayGo
//
//  Created by Mac on 19.06.25.
//

import Foundation

final class FileManagerHelper {
    static let shared = FileManagerHelper()
    private init() {}
    
    func readFilePath() -> URL {
        let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = file[0].appendingPathComponent("Favorites.json")
        print(path)
        return path
    }
    
    func writeDataTo<T: Codable>(data: T) {
        do {
            var data = try JSONEncoder().encode(data)
            try data.write(to: readFilePath())
        } catch {
            print(error)
        }
    }
    
    func deleteData<T: Codable & Equatable>(from data: T) {
        do {
            let data = try Data(contentsOf: readFilePath())
            var existingData = try JSONDecoder().decode([T].self, from: data)
            
            if let index = existingData.firstIndex(of: data as! T) {
                existingData.remove(at: index)
                
                let _ = try JSONEncoder().encode(existingData)
                try data.write(to: readFilePath())
            }
        } catch {
            print(error)
        }
    }
    
    func readDataFromFile<T: Codable>(completion: ((T) -> Void)) {
        do {
            let data = try Data(contentsOf: readFilePath())
            let userData = try JSONDecoder().decode(T.self, from: data)
            completion(userData)
        } catch {
            print(error)
        }
    }
}
