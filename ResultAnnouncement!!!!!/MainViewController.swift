//
//  ViewController.swift
//  ResultAnnouncement!!!!!
//
//  Created by 杉山和輝 on 2020/07/11.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertLabel.isHidden = true
    }

    @IBAction func playButton(_ sender: Any) {
        // TextFieldに入力がない場合はreturn
        guard idTextField.text != "" else {
            alertLabel.isHidden = false
            return
        }
        
        alertLabel.isHidden = true
        
        guard let mailText = idTextField.text else { return }
        Auth.auth().fetchSignInMethods(forEmail: mailText) { (authDataResult, error) in
            if let error = error {
                print("error : \(error)")
                // Firebase上に登録されていれば設定画面に遷移
                self.performSegue(withIdentifier: "register", sender: self)
            } else {
                print("user create complete")
                // Firebase上に登録されていれば設定画面に遷移
                self.performSegue(withIdentifier: "ruleSetting", sender: self)
                return
            }
        }
    }
}

