//
//  HomeViewController.swift
//  TwitterTest
//
//  Created by Maks on 5/26/16.
//  Copyright © 2016 Maks. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func logout() {
        TwitterClient.sharedInstance.logout()
    }

}
