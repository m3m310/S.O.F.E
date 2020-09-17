//
//  HomeViewController.swift
//  S.O.F.E
//
//  Created by Meme Mhd on 15/09/2020.
//  Copyright © 2020 S.O.F.E. All rights reserved.
//

import UIKit
import Firebase


class HomeViewController: UIViewController {

    private let signotImage: UIButton = {
        let signotImage = UIButton()
        signotImage.setImage(UIImage(systemName: "power"), for: .normal)
        signotImage.tintColor = .black
        signotImage.contentMode = .scaleAspectFit
        signotImage.layer.masksToBounds = true
        return signotImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(signotImage)
        signoutPressed()
    }
}
//MARK: - to sign out
extension HomeViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signotImage.frame = CGRect(x: view.right - 30, y: 60, width: 20, height: 20)
    }
    
    func signoutPressed(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            signotImage.addTarget(self, action: #selector(didSignOutPressed), for: .touchUpInside)
        } catch {
            errorMesseges(title: "Error Messege", messege: "Error signing out")
        }
    }
    @objc func didSignOutPressed(){
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
    }
}
//MARK: - to display error messeges
extension HomeViewController{
    func errorMesseges(title: String ,messege: String){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
