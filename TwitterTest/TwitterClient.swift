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
    
    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://api.twitter.com"), consumerKey: "aCaciS7xZDNkAPXPCazgbNq2R", consumerSecret: "opNdQGUHSEVeu9qbYs9wmcMOPXxy8d5V518cO1ZLtaA3qtUaHr")
    
    var loginSuccess: (()->())?
    var loginFailure: ((NSError)->())?
    
    //Getting request token to open up auth link in safari
    func login(success: ()->(), failure: (NSError) -> () ) {
        loginSuccess = success
        loginFailure = failure
        
        deauthorize()
        
        fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "twittertest://oauth"), scope: nil, success: { (requestToken) in
            print("Got token")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authenticate?oauth_token" + requestToken.token)!
            
            UIApplication.sharedApplication().openURL(url)
            }) { (error) in
                print("Error: \(error.localizedDescription)")
                self.loginFailure?(error)
                
        }
    }
    //get access token and save user
    func handleOpenURL(url: NSURL) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.splashDeleay = true
        
        let requestToken = BDBOAuth1Credential(queryString: url.query)!
        
        //Getting access token
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken) in
                self.loginSuccess?()
            // TODO:
            }) { (error) in
                print("Error: \(error.localizedDescription)")
                self.loginFailure?(error)
        }
    }
    
    
}
