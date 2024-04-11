//
//  Authentication.swift
//  Interestinger
//
//  Created by Micael Raste on 4.3.2024.
//

import Foundation
import SwiftUI

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

class Webservice {
    func login(username: String, password: String, completion: @escaping(Result<String, AuthenticationError>) -> Void) {
        // Replace this with actual login logic, create a URLRequest, and handle the response
        // For now, I'll simulate a successful login with a dummy token
        let dummyToken = "dummyToken"
        completion(.success(dummyToken))
    }
}

class LoginViewModel: ObservableObject {
    @Published var loginAlert = false
    @Published var isAuthenticated: Bool = false

    var username: String = ""
    var password: String = ""

    func login() {
        let defaults = UserDefaults.standard

        Webservice().login(username: username, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "tokenName")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                self.loginAlert = true
                print(error.localizedDescription)
            }
        }
    }

    func signout() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "tokenName")
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
}
