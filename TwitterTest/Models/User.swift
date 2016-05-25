//
//  User.swift
//  TwitterTest
//
//  Created by Maks on 5/25/16.
//  Copyright © 2016 Maks. All rights reserved.
//

import UIKit

class User {
    
    static let userDidLogoutNotification = "UserDidLogout"
    
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
    }
    
    static var _currentUser: User?
    
    static let kCurrentUser = "currentUser"
    
    class var currentUser: User? {
        get {
            if (_currentUser == nil) {
                let defaults = NSUserDefaults.standardUserDefaults()
                let userData = defaults.objectForKey(kCurrentUser) as? NSData
                
                if let userData = userData {
                    let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
                    
                    _currentUser = User(dictionary: dictionary)
                }
            }
            
            return _currentUser
        }
        
        set(user) {
            _currentUser = user
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user {
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                defaults.setObject(data, forKey: kCurrentUser)
            } else {
                defaults.setObject(nil, forKey: kCurrentUser)
            }
            
        }
    }
}
