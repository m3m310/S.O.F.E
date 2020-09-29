//
//  ForgetPasswordViewController.swift
//  S.O.F.E
//
//  Created by Meme Mhd on 16/09/2020.
//  Copyright © 2020 S.O.F.E. All rights reserved.
//

import UIKit
import Firebase


class ForgetPasswordViewController: UIViewController {
    private let skipImage: UIButton = {
        let skipImage = UIButton()
        skipImage.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        skipImage.tintColor = .black
        skipImage.contentMode = .scaleAspectFit
        skipImage.layer.masksToBounds = true
        return skipImage
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "inter your email?"
        title.font = .systemFont(ofSize: 15, weight: .light)
        title.numberOfLines = 1
        return title
    }()
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "email"
        emailTextField.leftViewMode = .always
        emailTextField.layer.shadowColor = UIColor.darkGray.cgColor
        emailTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        emailTextField.layer.shadowOpacity = 1
        emailTextField.layer.shadowRadius = 0.0
        emailTextField.layer.backgroundColor = UIColor.white.cgColor
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        emailTextField.returnKeyType = .done
        return emailTextField
    }()
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "new password"
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.shadowColor = UIColor.darkGray.cgColor
        passwordTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        passwordTextField.layer.shadowOpacity = 1
        passwordTextField.layer.shadowRadius = 0.0
        passwordTextField.layer.backgroundColor = UIColor.white.cgColor
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()

    private let forgetPasswordButton: UIButton = {
        let forgetPasswordButton = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .regular, scale: .large)
        let image = UIImage(systemName: "arrow.right.circle.fill", withConfiguration: largeConfig)
        forgetPasswordButton.setImage(image, for: .normal)
        forgetPasswordButton.layer.cornerRadius = 25
        forgetPasswordButton.tintColor = .black
        forgetPasswordButton.contentMode = .scaleAspectFit
        forgetPasswordButton.layer.masksToBounds = true
        forgetPasswordButton.isExclusiveTouch = false
        
        return forgetPasswordButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(skipImage)
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(forgetPasswordButton)
        
        forgetPasswordButton.addTarget(self, action: #selector(forgetPassordButtonPressed), for: .touchUpInside)
        skipImage.addTarget(self, action: #selector(skipButtonPressed), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        skipImage.frame = CGRect(x: view.right - 30, y: 60, width: 20, height: 20)
        titleLabel.frame = CGRect(x: view.left + 30, y: 200, width: view.width, height: 40)
        emailTextField.frame = CGRect(x: view.left + 30, y: titleLabel.bottom + 30, width: view.width - 60, height: 35)
        forgetPasswordButton.frame = CGRect(x: view.right - 100, y: emailTextField.bottom + 30, width: 50, height: 50)
    }
    
    @objc private func forgetPassordButtonPressed(){
        emailTextField.resignFirstResponder()
        
        print("work")
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            return errorMesseges(title: "Empty Fields", messege: "Please fill the requierd fields don't left them empty")
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            guard error == nil else{
                return self.errorMesseges(title: "Reset Failed", messege: "There is an error in resting the password.\(String(describing: error))")
            }
            let alert = UIAlertController(title: "", message: "We have just sent you a password reset email, please check your inbox and follow the instructions to reset your password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                let vc = LoginViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        }
    }
    @objc func skipButtonPressed(){
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
extension ForgetPasswordViewController{
    func errorMesseges(title: String ,messege: String){
       let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}


