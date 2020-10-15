//
//  SceneDelegate.swift
//  Sample-App
//
//  Created by Jake King on 9/24/20.
//  Copyright © 2020 Jake King. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else {
            return
        }
        
        self.window = UIWindow(windowScene: scene)
        //self.window?.backgroundColor = .backgroundTertiary
        //self.window?.tintColor = .interactive
        self.window?.rootViewController = MarvelViewController()
        self.window?.makeKeyAndVisible()
    }

}

