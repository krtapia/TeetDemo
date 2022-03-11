//
//  AddPostViewController.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 25/02/22.
//

import UIKit
import Simple_Networking
import SVProgressHUD
import NotificationBannerSwift

class AddPostViewController: UIViewController{
    //MARK:- IBOutlets
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var priviewImageView: UIImageView!
    
    //MARK:- IBActions
    @IBAction func addPostAction() {
        savePost()
    }
    
    @IBAction func dismissAction() {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func savePost() {
        let request = PostRequest(text: postTextView.text, imageUrl: nil, videoUrel: nil, location: nil)
        SVProgressHUD.show()
        SN.post(endpoint: Endpoints.post, model: request) { (response: SNResultWithEntity<Post, ErrorResponse>) in
            SVProgressHUD.dismiss()
            
            switch response {
            case .success:
                self.dismiss(animated: true,completion: nil)
                
            case .error(let error):
                NotificationBanner(title: "Error", subtitle: error.localizedDescription, style: .danger).show()
                
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: entity.error, style: .warning).show()
            }
        }
    }
}





