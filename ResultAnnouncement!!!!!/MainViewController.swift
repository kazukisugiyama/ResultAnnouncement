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
        
        do {
            // 要確認
            let uid = try Auth.auth().getStoredUser(forAccessGroup: "friend").uid
            guard idTextField.text == uid else {
                self.performSegue(withIdentifier: "ruleSetting", sender: self)
                return
            }
        } catch  {
            print("firebase error")
        }
        
        // Firebase上に登録されていれば設定画面に遷移
        self.performSegue(withIdentifier: "register", sender: self)
        
    }
}

