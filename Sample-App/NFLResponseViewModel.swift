//
//  NFLResponseViewModel.swift
//  Sample-App
//
//  Created by Jake King on 10/5/20.
//  Copyright © 2020 Jake King. All rights reserved.
//

import Foundation
import Moya
import CoreData
import UIKit

/*
 * NFLResponseViewModel - Handles Responses from the NFL api
 */
final class NFLReponseViewModel {
    
    class ViewController: UIViewController {


        var container: NSPersistentContainer!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            guard container != nil else {
                fatalError("This view model needs a persistent container.")
            }
            // The persistent container is available.
        }
    }
    
    private let NFLProvider: MoyaProvider<NFLService>
    
    // MARK - Initializers
    init() {
        NFLProvider = MoyaProvider(stubClosure: MoyaProvider.immediatelyStub)
        
        NFLProvider.request(.teams(query: NFLRequestHelper.testQuery,fieldSelector: NFLRequestHelper.testFieldSelector)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                let message = String(data: data, encoding: .utf8)!

                print("MSG: ",message)
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

// MARK: - Helpers
struct NFLRequestHelper {
    public static var testQuery = "{\"$query\" : {\"abbr\" : \"HOU\"}}"
    public static var testFieldSelector = "{fullName,branding{logos{logo{href}}, size}conference,division,webDomain,venue{name, ticketPhoneNumber, ticketUrl},established,standings{overallWins, overallLosses, overallTies, divisionRank}}"
}
