//
//  Helpers.swift
//  Groupy
//
//  Created by Develop on 09/08/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import Foundation
import UIKit
 
class LocalState {
    static let shared = LocalState()
     let defualts = UserDefaults.standard
    
    private enum Keys:String {
        case hasOnboarded
    }
    
    public static var hasOnboarded:Bool {
        get{
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
