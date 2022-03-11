//
//  RegisterViewController.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 17/01/22.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD

class RegisterViewController: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    //MARK: - IBActions
    @IBAction func registerButtonAction(){
        view.endEditing(true)
        performRegister()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI(){
        registerButton.layer.cornerRadius = 40
        
    }
    
    private func performRegister(){
        guard let email = emailTextField.text, !email.isEmpty else{
            NotificationBanner(title: "error", subtitle: "Debes introducir un correo", style: .warning).show()
            
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else{
            NotificationBanner(title: "error", subtitle: "Debes introducir una contraseña.", style: .warning).show()
            
            return
            
        }
        
        guard let name = nameTextField.text, !name.isEmpty else{
            NotificationBanner(title: "error", subtitle: "Debes introducir tu nombre y apellido.", style: .warning).show()
            
            return
            
        }
        
        
        let request = RegisterRequest(email: email, password: password, name: name)
        SVProgressHUD.show()
        SN.post(endpoint: Endpoints.register, model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
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
            
            //performSegue(withIdentifier: "ShowHome", sender: nil)
            
            //registrarnos aqui
            
        }
        
    }
}


