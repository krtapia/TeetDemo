//
//  WelcomeViewController.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 17/01/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    private func setupUI(){
        loginButton.layer.cornerRadius = 25
        
    }

}
