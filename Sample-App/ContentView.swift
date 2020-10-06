//
//  ContentView.swift
//  Sample-App
//
//  Created by Jake King on 9/24/20.
//  Copyright © 2020 Jake King. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let NFLRespnse: NFLReponseViewModel
    
    var body: some View {
        Text("Hello, World!")
    }
    
    init() {
        NFLRespnse = NFLReponseViewModel()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
