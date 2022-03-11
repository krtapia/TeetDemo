//
//  HomeViewController.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 24/02/22.
//

import UIKit
import Simple_Networking
import SVProgressHUD
import NotificationBannerSwift

class HomeViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    // MARK:- Properties
    private let cellId = "TweetTableViewCell"
    private var dataSource = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getposts()
    }
    
    private func setupUI() {
        //1.- Asignar datasource
        //2.- registrar celda
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    private func getposts() {
        SVProgressHUD.show()
        SN.get(endpoint: Endpoints.getPost) { (response: SNResultWithEntity<[Post], ErrorResponse>) in
            SVProgressHUD.dismiss()
            
            switch response {
            case .success( let posts):
                self.dataSource = posts
                self.tableView.reloadData()
                
            case .error(let error):
                NotificationBanner(title: "Error", subtitle: error.localizedDescription, style: .danger).show()
                
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: entity.error, style: .warning).show()
            }
        }
    }
    
    private func deletePostAt(indexPath: IndexPath) {
        SVProgressHUD.show()
        let postId = dataSource[indexPath.row].id
        let endPoint = Endpoints.delete + postId
        SN.delete(endpoint: endPoint) { (response: SNResultWithEntity<GeneralResponse, ErrorResponse>) in
            SVProgressHUD.dismiss()
            
            switch response {
            case .success:
                self.dataSource.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .left)
                
            case .error(let error):
                NotificationBanner(title: "Error", subtitle: error.localizedDescription, style: .danger).show()
                
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: entity.error, style: .warning).show()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    private func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowAction.Style.destructive, title: "Borrar") { _, _ in
            self.deletePostAt(indexPath: indexPath)
        }
        return [deleteAction]
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return dataSource[indexPath.row].author.email != "slipangels_@hotmail.com"
    }
}
//MARK:- UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    // numero total de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    // Configurar celda deseada
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? TweetTableViewCell {
            // configurar la celda
            cell.setupCellWith(post: dataSource[indexPath.row])
        }
        
        return cell
    }
}






