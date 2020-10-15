//
//  NetworkManager.swift
//  Sample-App
//
//  Created by Jake King on 10/13/20.
//  Copyright © 2020 Jake King. All rights reserved.
//

import Foundation
import Moya

final class NetworkManager {
    
    private(set) static var shared: NetworkManager!

    var MarvelProvider: MoyaProvider<MarvelService> = MoyaProvider(stubClosure: MoyaProvider.neverStub)
    
    init() {
        Self.shared = self
    }
}
