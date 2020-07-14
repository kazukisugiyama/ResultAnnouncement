//
//  RegistrationViewController.swift
//  ResultAnnouncement!!!!!
//
//  Created by 杉山和輝 on 2020/07/12.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {

    @IBOutlet weak var alertMailAddresLabel: UILabel!
    @IBOutlet weak var alertPasswordLabel: UILabel!
    @IBOutlet weak var alertPasswordReEnterLabel: UILabel!
    @IBOutlet weak var mailAddresTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordReEnterTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertMailAddresLabel.isHidden = true
        alertPasswordLabel.isHidden = true
        alertPasswordReEnterLabel.isHidden = true
    }
    
    @IBAction func registerButton(_ sender: Any) {
        // 入力チェック
        noInputCheck()
        passwordInputCheck()
        
        guard let mailAddresText = mailAddresTextField.text,
            let passwordText = passwordTextField.text else { return }
        
        // Firebaseにメールアドレス、パスワードを登録
        Auth.auth().createUser(withEmail: mailAddresText, password: passwordText) { (authDataResult, error) in
            if let error = error {
                print("error : \(error)")
            } else {
                print("user create complete")
                // チャット画面に遷移
                self.performSegue(withIdentifier: "ruleSetting", sender: nil)
            }
        }
    }
    
    func noInputCheck() {
        var isInput = true
        
        if mailAddresTextField.text == "" {
            alertMailAddresLabel.isHidden = false
            isInput = false
        } else {
            alertMailAddresLabel.isHidden = true
        }
        if passwordTextField.text == "" {
            alertPasswordLabel.isHidden = false
            isInput = false
        } else {
            alertPasswordLabel.isHidden = true
        }
        if passwordReEnterTextField.text == "" {
            alertPasswordReEnterLabel.isHidden = false
            isInput = false
        } else {
            alertPasswordReEnterLabel.isHidden = true
        }
        
        guard isInput else { return }
    }
    
    func passwordInputCheck() {
        guard passwordTextField.text == passwordReEnterTextField.text else {
            alertPasswordLabel.isHidden = false
            alertPasswordLabel.text = "パスワード再入力と一致しません"
            alertPasswordReEnterLabel.isHidden = false
            alertPasswordReEnterLabel.text = "パスワードと一致しません"
            return
        }
    }
    
}
