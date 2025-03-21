//
//  AuthVievModel.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import Foundation

@Observable
class AuthViewModel {
    var user: String = ""
    var pass: String = ""
    var authUser : String = ""
    var authPass : String = ""
    
    func auth() {
        self.authPass = self.pass
        self.authUser = self.user
    }
}
