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
    
    private enum Keys:String {
        case hasOnboarded
        case userInfo
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
    
    public static var userInfo:[String:Any] {
        get {
            return UserDefaults.standard.dictionary(forKey: Keys.userInfo.rawValue)!
        }
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: Keys.userInfo.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
