//
//  MarvelService.swift
//  Sample-App
//
//  Created by Jake King on 10/14/20.
//  Copyright © 2020 Jake King. All rights reserved.
//

import Foundation
import CommonCrypto
import Moya

enum MarvelService {
    case characters
}

extension MarvelService: TargetType {
    var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/")!
    }
    
    var path: String {
        switch self {
        case .characters:
            return "v1/public/characters"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .characters:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .characters:
            return "characters sample".utf8Encoded
        }
    }
    
    var task: Task {
        let ts = String(Date().currentTimeMillis())
        switch self {
        case .characters:
            return .requestParameters(parameters: ["ts": ts,
                                                   "apikey": APIHelper.apikey,
                                                   "hash": String(ts + APIHelper.privatekey + APIHelper.apikey).md5,
                                                   "limit": 1], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
}

// MARK: - Helpers
private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
    var md5: String {
        let data = Data(self.utf8)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
