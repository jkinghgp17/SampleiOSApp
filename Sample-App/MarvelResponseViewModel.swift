//
//  MarvelResponseViewModel.swift
//  Sample-App
//
//  Created by Jake King on 10/15/20.
//  Copyright © 2020 Jake King. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

final class MarvelResponseViewModel {
    
    init() {
        
        NetworkManager.shared.MarvelProvider.request(.characters) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let json = try? JSON(data: data)
                let statusCode = moyaResponse.statusCode
                let message = String(data: data, encoding: .utf8)!
                
                let context = ModelManager.shared.viewContext
                
                let character = NSEntityDescription.insertNewObject(forEntityName: "CharacterInfo",
                                                                    into: context) as! CharacterInfo
                character.name = json!["data"]["results"][0]["name"].string
                character.characterDescription = json!["data"]["results"][0]["description"].string
                
                ModelManager.shared.saveContext()
                break
            case let .failure(error):
                // this means there was a network failure - either the request
                // wasn't sent (connectivity), or no response was received (server
                // timed out).  If the server responds with a 4xx or 5xx error, that
                // will be sent as a ".success"-ful response.
                break
            }
        }
        
    }
}
