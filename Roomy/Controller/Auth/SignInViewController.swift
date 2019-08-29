//
//  SignInViewController.swift
//  Roomy
//
//  Created by Awady on 7/25/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SignInPressed(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty else { return }
        guard let password = PasswordTF.text, !password.isEmpty else { return }
        
        API.signIn(email: email, password: password) { (error: Error?,success: Bool) in
        }
    }
}
