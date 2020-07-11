//
//  ViewController.swift
//  ResultAnnouncement!!!!!
//
//  Created by 杉山和輝 on 2020/07/11.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playButton(_ sender: Any) {
        self.performSegue(withIdentifier: "ruleSetting", sender: self)
    }
}

