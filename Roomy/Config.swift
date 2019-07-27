//
//  Config.swift
//  Roomy
//
//  Created by Awady on 7/26/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import Foundation

struct URLs {
    static let main = "https://roomy-application.herokuapp.com/"
    
    /// post {email, password}
    static let signIn = main + "auth/login"
    
    /// post {name, email, password}
    static let signUp = main + "signup"
}
