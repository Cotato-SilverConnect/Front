//
//  FileLoader.swift
//  SilverConnect
//
//  Created by 최준영 on 2023/07/01.
//

import Foundation


struct FileLoader {
    private init() { }
    
    enum FileName: String {
        case dong = "dong"
        case gu = "gu"
    }
    
    static let shared = FileLoader()
    
    func loadData<T: Decodable>(fileName: FileName, ext: String = "json") -> T? {
        if let fileURL = Bundle.main.url(forResource: fileName.rawValue, withExtension: ext) {
            if let data = try? Data(contentsOf: fileURL) {
                if let decoded = try? JSONDecoder().decode(T.self, from: data) {
                    return decoded
                }
                print("디코딩 에러")
                return nil
            }
            print("data로딩 에러")
            return nil
        }
        print("url생성 에러")
        return nil
    }
    
}
