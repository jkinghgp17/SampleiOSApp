//
//  NFLService.swift
//  Sample-App
//
//  Created by Jake King on 10/1/20.
//  Copyright © 2020 Jake King. All rights reserved.
//

import Foundation
import Moya

enum NFLService {
    case teams(query: String,fieldSelector: String)
}

// MARK: - TargetType Protocol Implementation
extension NFLService: TargetType {
    var path: String {
        switch self {
        case .teams(_,_):
            return "/teams"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .teams:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .teams(let query, let fieldSelector):
            return ServiceHelper.teamsSample.utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case let .teams(query,fieldSelector):
            return .requestParameters(parameters: ["s":query,"fs":fieldSelector], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
    
    var baseURL: URL { return URL(string: "https://api.nfl.com/v1")!}
}

// MARK: - Helpers
private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

struct ServiceHelper {
    public static var teamsSample = """
        {
       \"pager\": {},
       \"data\": [
           {
               \"fullName\": \"Houston Texans\",
               \"conference\": \"AFC\",
               \"division\": \"ACS\",
               \"webDomain\": \"http://www.houstontexans.com\",
               \"established\": 2002,
               \"venue\": {
                   \"name\":\"NRG Stadium\",
                   \"ticketPhoneNumber\" : \"832-667-2390\",
                   \"ticketUrl\" : \"http://www.nfl.com/tickets/houston-texans\"
               },
               "standings" : {
                   "overallWins":8,
                   "overallLosses":4,
                   "overallTies":0,
                   "divisionRank":2
               }
           }
       ]
    }
    """
}
