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
    
    /// POST {email, password}
    static let signIn = main + "auth/login"
    
    /// POST {name, email, password}
    static let signUp = main + "signup"
    
    /// GET {API_token, user}
    static let Home = main + "rooms"
}
