//
//  LoginViewController.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 17/01/22.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD

class LoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //MARK: - IBActions
    @IBAction func loginButtonAction(){
        view.endEditing(true)
        performLogin()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Private methods
    
    private func setupUI(){
        loginButton.layer.cornerRadius = 20
    }
    
    private func performLogin(){
        guard let email = emailTextField.text, !email.isEmpty else{
            NotificationBanner(title: "error", subtitle: "Debes introducir un correo", style: .warning).show(on:self)
            
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else{
            NotificationBanner(title: "error", subtitle: "Debes introducir una contraseña.", style: .warning).show(on:self)
            
            return
            
        }
        
        
        
        let request = LoginRequest(email: email, password: password)
        SVProgressHUD.show()
        SN.post(endpoint: Endpoints.login, model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            
            SVProgressHUD.dismiss()
            
            switch response {
            case .success( let user):
                self.performSegue(withIdentifier: "showHome", sender: nil)
                SimpleNetworking.setAuthenticationHeader(prefix: "", token: user.token)
                
                
            case .error(let error):
                NotificationBanner(title: "Error", subtitle: error.localizedDescription, style: .danger).show()
                
                
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: entity.error, style: .warning).show()
                
                
            }
            
            
        }
        
        //Iniciar sesion aqui
        
    }
    
}
