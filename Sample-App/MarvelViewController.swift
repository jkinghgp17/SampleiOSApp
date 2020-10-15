//
//  MarvelViewController.swift
//  Sample-App
//
//  Created by Jake King on 10/15/20.
//  Copyright © 2020 Jake King. All rights reserved.
//

import Foundation
import UIKit

final class MarvelViewController: UIViewController {
    
    private let responseViewModel = MarvelResponseViewModel()
    
     // MARK: - Initializers
        override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
           super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
       }
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
       
       // MARK: - Deinitialization
       deinit {
           
       }
}
