//
//  LoginViewController.swift
//  TwitterTest
//
//  Created by Maks on 5/25/16.
//  Copyright © 2016 Maks. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoMovedToTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoHeightOriginalConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoHeightSmallerConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel : UILabel!
    @IBOutlet weak var buttonContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonContainerView.layer.cornerRadius = 5
        
        buttonContainerView.alpha = 0
        titleLabel.alpha = 0
        subtitleLabel.alpha = 0
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        logoVerticalConstraint.active = false
        logoMovedToTopConstraint.active = true
        
        logoHeightOriginalConstraint.active = false
        logoHeightSmallerConstraint.active = true
        
        UIView.animateWithDuration(1.5) {
            self.view.layoutIfNeeded()
            
            self.buttonContainerView.alpha = 1
            self.titleLabel.alpha = 1
            self.subtitleLabel.alpha = 1
            
            self.buttonContainerView.frame = CGRectOffset(self.buttonContainerView.frame, 0, -20)
            self.titleLabel.frame = CGRectOffset(self.titleLabel.frame, 0, -20)
            self.subtitleLabel.frame = CGRectOffset(self.subtitleLabel.frame, 0, -20)
        }
    }

    

}
