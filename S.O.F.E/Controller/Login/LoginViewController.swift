//
//  LoginViewController.swift
//  S.O.F.E
//
//  Created by Meme Mhd on 15/09/2020.
//  Copyright © 2020 S.O.F.E. All rights reserved.
//


import UIKit
import Firebase

class LoginViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.layer.masksToBounds = true
        return scrollView
    }()

    private let backgroundImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "image"))
        image.frame = CGRect(x: -80, y: -74, width: 558, height: 522)
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let skipImage: UIButton = {
          let skipImage = UIButton()
          skipImage.setImage(UIImage(systemName: "chevron.right"), for: .normal)
          skipImage.tintColor = .black
          skipImage.contentMode = .scaleAspectFit
          skipImage.layer.masksToBounds = true
          return skipImage
      }()
    
    private let wellcomeLabel: UILabel = {
        let wellcomeLabel = UILabel()
        wellcomeLabel.frame = CGRect(x: 56, y: 150, width: 200, height: 29)
        wellcomeLabel.text = "Wellcome Back"
        wellcomeLabel.font = .systemFont(ofSize: 23, weight: .semibold)
        return wellcomeLabel
    }()
    private let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.circle")
        profileImage.tintColor = .lightGray
        profileImage.contentMode = .scaleAspectFit
        return profileImage
    }()
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.leftViewMode = .always
        emailTextField.layer.shadowColor = UIColor.darkGray.cgColor
        emailTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        emailTextField.layer.shadowOpacity = 1
        emailTextField.layer.shadowRadius = 0.0
        emailTextField.layer.backgroundColor = UIColor.white.cgColor
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        emailTextField.returnKeyType = .next
        return emailTextField
    }()
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "password"
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.shadowColor = UIColor.darkGray.cgColor
        passwordTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        passwordTextField.layer.shadowOpacity = 1
        passwordTextField.layer.shadowRadius = 0.0
        passwordTextField.layer.backgroundColor = UIColor.white.cgColor
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        return passwordTextField
    }()
    private let signinLabel: UILabel = {
        let signinLabel = UILabel()
        signinLabel.text = "Sign in"
        signinLabel.font = .systemFont(ofSize: 23, weight: .medium)
        return signinLabel
    }()
      private let signinButton: UIButton = {
         let signinButton = UIButton()
         let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .regular, scale: .large)
         let image = UIImage(systemName: "arrow.right.circle.fill", withConfiguration: largeConfig)
         signinButton.setImage(image, for: .normal)
         signinButton.layer.cornerRadius = 25
         signinButton.tintColor = .black
         signinButton.contentMode = .scaleAspectFit
         signinButton.layer.masksToBounds = true
         signinButton.isExclusiveTouch = false
         return signinButton
     }()
    private  let signupLabel: UILabel = {
        let signupLabel = UILabel()
        signupLabel.text = "Sign up"
        signupLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        return signupLabel
    }()
    private  let signUpLabel: UILabel = {
        let signupLabel = UILabel()
        signupLabel.text = "Don't have an account yet? "
        signupLabel.font = .systemFont(ofSize: 15, weight: .light)
        return signupLabel
    }()
    private let forgetPasswordLabel: UIButton = {
        let forgetPasswordLabel = UIButton()
        forgetPasswordLabel.setTitle("Forget Password", for: .normal)
        forgetPasswordLabel.titleLabel?.font = .systemFont(ofSize: 10, weight: .light)
        forgetPasswordLabel.setTitleColor(.black, for: .normal)
        forgetPasswordLabel.isExclusiveTouch = false
        return forgetPasswordLabel
    }()
   //MARK: - set the views frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = view.width / 3
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height - 190 )
        wellcomeLabel.frame = CGRect(x: view.left + 30, y: 150, width: view.width - 89, height: 40)
        skipImage.frame = CGRect(x: view.right - 30, y: 60, width: 20, height: 20)
        profileImage.frame = CGRect(x:( view.width - size) / 2, y: 250, width: size, height: size)
        profileImage.layer.cornerRadius = profileImage.width / 2
        emailTextField.frame = CGRect(x: view.left + 30, y: profileImage.bottom + 30, width: view.width - 60, height: 35)
        passwordTextField.frame = CGRect(x: view.left + 30, y: emailTextField.bottom + 20, width: view.width - 60, height: 35)
        signinLabel.frame = CGRect(x: view.left + 47, y: passwordTextField.bottom + 60, width: view.width - 89, height: 29)
        signinButton.frame = CGRect(x: view.right - 100, y: passwordTextField.bottom + 50, width: 50, height: 50)
        signUpLabel.frame = CGRect(x: (( view.width) / 2) - 130, y: signinLabel.bottom + 20, width: 200, height: 29)
        signupLabel.frame = CGRect(x: signUpLabel.left + 190 , y: signinLabel.bottom + 20, width: 70, height: 29)
        forgetPasswordLabel.frame = CGRect(x: view.right - 130, y: passwordTextField.bottom + 3, width:  89, height: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      to open ather bage
        skipImage.addTarget(self, action: #selector(didSkipButton), for: .touchDown)
        skipImage.isUserInteractionEnabled = true
        
        let signupGesture = UITapGestureRecognizer(target: self, action: #selector(didSignupPreassed))
        signupLabel.addGestureRecognizer(signupGesture)
        signupLabel.isUserInteractionEnabled = true
        
        forgetPasswordLabel.addTarget(self, action: #selector(didForgetPasswordPressed), for: .touchUpInside)
        
        signinButton.addTarget(self, action: #selector(signinButtonPressed), for: .touchUpInside)

//      add view to the page
        view.backgroundColor = .white
//        view.addSubview(backgroundImage)
        view.addSubview(skipImage)
        view.addSubview(scrollView)
        scrollView.addSubview(wellcomeLabel)
        scrollView.addSubview(profileImage)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(signinLabel)
        scrollView.addSubview(signinButton)
        scrollView.addSubview(signupLabel)
        scrollView.addSubview(signUpLabel)
        scrollView.addSubview(forgetPasswordLabel)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let userEmail = UserDefaults.standard.value(forKey: Constent.KUserEmail) as? String {
            emailTextField.text = userEmail
//            let userPassword = KeychainPasswordItem(service: KeychainConfigration.serviceName, account: userEmail, accessGroup: KeychainConfigration.accessGroup)
//            if let password = try! userPassword.readPassword() as? String {
//                passwordTextField.text = password
//            }
        }
    }
    
 //MARK: - check and save data
    @objc private func signinButtonPressed(){
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty, !password.isEmpty else{
            return errorMesseges(title: "Empty Fields", messege: "Please fill the requierd fields don't left them empty.")
        }
        authenticateUserWithEmail(email: email, password: password)
    }
    func authenticateUserWithEmail(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard let _ = authResult, error == nil else {
                return self.errorMesseges(title: "Creation Failed", messege: "Failed to log in user with email: \(email). ")
            }
            //use the keychain to save the password and the userDefult for first and last name
            if UserDefaults.standard.value(forKey: Constent.KUserEmail) == nil{
                let userDefults = UserDefaults.standard
                userDefults.set(email, forKey: Constent.KUserEmail)
                userDefults.synchronize()
                
                let passwordKeychain = KeychainPasswordItem(service: KeychainConfigration.serviceName, account: email, accessGroup: KeychainConfigration.accessGroup)
                do {
                    try passwordKeychain.savePassword(password)
                } catch let error {
                    print("Error updating keychain: \(error.localizedDescription)")
                }
            }
            self.goToOtherPage(vc: TabBarViewController())
        }
    }
}
//MARK: - go to the other page
extension LoginViewController{
    @objc private func didSkipButton(){
        goToOtherPage(vc: TabBarViewController())
    }
    @objc private func didSignupPreassed(){
        goToOtherPage(vc: RegisterViewController())
    }
    @objc private func didForgetPasswordPressed(){
        goToOtherPage(vc: ForgetPasswordViewController())
    }
    func goToOtherPage(vc: UIViewController){
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
    }
}
//MARK: - view controller delegate
extension LoginViewController: UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
            signinButtonPressed()
        }
        return true
    }
}
//MARK: - show error messege
extension LoginViewController{
    func errorMesseges(title: String ,messege: String){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
