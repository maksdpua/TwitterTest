//
//  TwitterClient.swift
//  TwitterTest
//
//  Created by Maks on 5/25/16.
//  Copyright © 2016 Maks. All rights reserved.
//

import UIKit
import BDBOAuth1Manager


class TwitterClient: BDBOAuth1SessionManager {
    //OAuth = Fetch Request Token + Redirect to Auth + Fetch Access Token + Callback
    
    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://publish.twitter.com"), consumerKey: "aCaciS7xZDNkAPXPCazgbNq2R", consumerSecret: "opNdQGUHSEVeu9qbYs9wmcMOPXxy8d5V518cO1ZLtaA3qtUaHr")
}
