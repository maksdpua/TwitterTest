//
//  SplashViewController.swift
//  TwitterTest
//
//  Created by Maks on 5/24/16.
//  Copyright © 2016 Maks. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !(appDelegate.splashDeleay) {
            delay(1.0, closure: { 
                self.continueLogin()
            })
        }
    }
    
    func goToLogin() {
        self.performSegueWithIdentifier("LoginSegue", sender: self)
    }
    
    func continueLogin() {
        appDelegate.splashDeleay = false
        self.goToLogin()
    }
    
}
