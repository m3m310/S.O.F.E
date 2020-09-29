//
//  RegisterViewController.swift
//  S.O.F.E
//
//  Created by Meme Mhd on 15/09/2020.
//  Copyright © 2020 S.O.F.E. All rights reserved.
//

import UIKit
import Firebase

//MARK: - present the views and navigate to login page
class RegisterViewController: UIViewController {
   
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
    
    private let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.circle")
        profileImage.tintColor = .lightGray
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.masksToBounds = true
        return profileImage
    }()
    private let firstNameTextField: UITextField = {
        let firstNameTextField = UITextField()
        firstNameTextField.placeholder = "First Name"
        firstNameTextField.layer.backgroundColor = UIColor.white.cgColor
        firstNameTextField.leftViewMode = .always
        firstNameTextField.layer.shadowColor = UIColor.darkGray.cgColor
        firstNameTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        firstNameTextField.layer.shadowOpacity = 1
        firstNameTextField.layer.shadowRadius = 0.0
        firstNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        firstNameTextField.returnKeyType = .next
        return firstNameTextField
    }()
    private let lastNameTextField: UITextField = {
        let lastNameTextField = UITextField()
        lastNameTextField.placeholder = "Last Name"
        lastNameTextField.leftViewMode = .always
        lastNameTextField.layer.shadowColor = UIColor.darkGray.cgColor
        lastNameTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        lastNameTextField.layer.shadowOpacity = 1
        lastNameTextField.layer.shadowRadius = 0.0
        lastNameTextField.layer.backgroundColor = UIColor.white.cgColor
        lastNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        lastNameTextField.returnKeyType = .next
        return lastNameTextField
    }()
    private let cityTextField: UITextField = {
        let cityTextField = UITextField()
        cityTextField.placeholder = "City"
        cityTextField.leftViewMode = .always
        cityTextField.layer.shadowColor = UIColor.darkGray.cgColor
        cityTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        cityTextField.layer.shadowOpacity = 1
        cityTextField.layer.shadowRadius = 0.0
        cityTextField.layer.backgroundColor = UIColor.white.cgColor
        cityTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        cityTextField.returnKeyType = .next
        return cityTextField
    }()
    private let districtTextField: UITextField = {
        let districtTextField = UITextField()
        districtTextField.placeholder = "District"
        districtTextField.leftViewMode = .always
        districtTextField.layer.shadowColor = UIColor.darkGray.cgColor
        districtTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        districtTextField.layer.shadowOpacity = 1
        districtTextField.layer.shadowRadius = 0.0
        districtTextField.layer.backgroundColor = UIColor.white.cgColor
        districtTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        districtTextField.returnKeyType = .next
        return districtTextField
    }()
    private let phoneNumberTextField: UITextField = {
        let phoneNumberTextField = UITextField()
        phoneNumberTextField.placeholder = "Phone Number +966"
        phoneNumberTextField.leftViewMode = .always
        phoneNumberTextField.layer.shadowColor = UIColor.darkGray.cgColor
        phoneNumberTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        phoneNumberTextField.layer.shadowOpacity = 1
        phoneNumberTextField.layer.shadowRadius = 0.0
        phoneNumberTextField.layer.backgroundColor = UIColor.white.cgColor
        phoneNumberTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        phoneNumberTextField.returnKeyType = .next
        phoneNumberTextField.keyboardType = .phonePad
        return phoneNumberTextField
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
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
   private let signupLabel: UILabel = {
        let signupLabel = UILabel()
        signupLabel.text = "Sign up"
        signupLabel.font = .systemFont(ofSize: 23, weight: .medium)
        return signupLabel
    }()
    
    private let signupButton: UIButton = {
        let signupButton = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .regular, scale: .large)
        let image = UIImage(systemName: "arrow.right.circle.fill", withConfiguration: largeConfig)
        signupButton.setImage(image, for: .normal)
        signupButton.layer.cornerRadius = 25
        signupButton.tintColor = .black
        signupButton.contentMode = .scaleAspectFit
        signupButton.layer.masksToBounds = true
        signupButton.isExclusiveTouch = false

        return signupButton
    }()
    
//MARK: - set the views frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.width / 3
        skipImage.frame = CGRect(x: view.right - 30, y: 60, width: 20, height: 20)
        profileImage.frame = CGRect(x:( view.width - size) / 2, y: 150, width: size, height: size)
        profileImage.layer.cornerRadius = profileImage.width / 2
        firstNameTextField.frame = CGRect(x: view.left + 30, y: profileImage.bottom + 30, width: view.width - 60, height: 35)
        lastNameTextField.frame = CGRect(x: view.left + 30, y: firstNameTextField.bottom + 20, width: view.width - 60, height: 35)
        cityTextField.frame = CGRect(x: view.left + 30, y: lastNameTextField.bottom + 20, width: view.width - 60, height: 35)
        districtTextField.frame = CGRect(x: view.left + 30, y: cityTextField.bottom + 20, width: view.width - 60, height: 35)
        phoneNumberTextField.frame = CGRect(x: view.left + 30, y: districtTextField.bottom + 20, width: view.width - 60, height: 35)
        emailTextField.frame = CGRect(x: view.left + 30, y: phoneNumberTextField.bottom + 20, width: view.width - 60, height: 35)
        passwordTextField.frame = CGRect(x: view.left + 30, y: emailTextField.bottom + 20, width: view.width - 60, height: 35)
        signupLabel.frame = CGRect(x: view.left + 47, y: passwordTextField.bottom + 40, width: view.width - 89, height: 29)
        signupButton.frame = CGRect(x: view.right - 100, y: passwordTextField.bottom + 30, width: 50, height: 50)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//      add view to the page
        view.backgroundColor = .white
//      view.addSubview(backgroundImage)
        view.addSubview(skipImage)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(cityTextField)
        view.addSubview(districtTextField)
        view.addSubview(profileImage)
        view.addSubview(phoneNumberTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signupButton)
        view.addSubview(signupLabel)
 
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        cityTextField.delegate = self
        districtTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
             
//      to skip the bage
        skipImage.addTarget(self, action: #selector(didSkipButton), for: .touchUpInside)
        skipImage.isUserInteractionEnabled = true
        
        
//      to open the photo library
        let photoGesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfile))
        profileImage.addGestureRecognizer(photoGesture)
        profileImage.isUserInteractionEnabled = true

//      to open home page after the registration
        signupButton.addTarget(self, action: #selector(didSignupButtonPressed), for: .touchUpInside)
        signupButton.isUserInteractionEnabled = true
   
    }

    @objc private func didSkipButton(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapChangeProfile(_ sender: UIGestureRecognizer){
        presentPhotoActionSheet()
    }
    
}

//MARK: - check and save data in firebase and dismiss the page
extension RegisterViewController{
    @objc private func didSignupButtonPressed(){
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        districtTextField.resignFirstResponder()
        phoneNumberTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let city = cityTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let district = districtTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let phoneNumber = phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !city.isEmpty, !district.isEmpty, !phoneNumber.isEmpty, !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty else{
            return errorMesseges(title: "Empty Fields", messege: "Please fill the requierd fields don't left them empty")
        }
        guard Extentions.isPasswordViald(password) else{
            return  errorMesseges(title: "Strong Password", messege: "please make sure your password is at least 8 charcters, and contains a special charcters and numbers")
        }
        guard Extentions.isValidEmail(email) else{
           return  errorMesseges(title: "Email Vaildation", messege: "please make sure your email is vaildate")
        }
        guard Extentions.isValidPhone(phoneNumber) else {
            return  errorMesseges(title: "Phone Correct", messege: "please make sure your phone number is contain the ")
        }
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard authResult != nil, error == nil else{
                return self.errorMesseges(title: "Creation Failed", messege: "There is a problem in creating user please try agine ")
            }
            self.updateUserName(firstName: firstName)
        }
    }
    func updateUserName(firstName: String){
        if let user = Auth.auth().currentUser{
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = firstName
            changeRequest.commitChanges { (error) in
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

//MARK: - change the profile image
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func presentPhotoActionSheet(){
        
        let actionSheet = UIAlertController(title: "Profile Photo", message: "How would you like to select a picture.", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
//    to take a photo from camera
    func presentCamera(){
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.delegate = self
            vc.allowsEditing = true
            present(vc, animated: true)
    }
    
    //    to take a photo from labrariy
    func presentPhotoPicker(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{return}
        self.profileImage.image = selectedImage
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

//MARK: - view controller delegate
extension RegisterViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField{
            lastNameTextField.becomeFirstResponder()
        }
        else if textField == lastNameTextField{
            cityTextField.becomeFirstResponder()
        }
        else if textField == cityTextField{
            districtTextField.becomeFirstResponder()
        }
        else if textField == districtTextField{
            phoneNumberTextField.becomeFirstResponder()
        }
        else if textField == phoneNumberTextField{
            emailTextField.becomeFirstResponder()
        }
        else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
            didSignupButtonPressed()
        }
        return true
    }
}

//MARK: - show error messege
extension RegisterViewController{
    func errorMesseges(title: String ,messege: String){
       let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
