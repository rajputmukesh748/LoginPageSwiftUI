//
//  LoginVM.swift
//  Login Page
//
//  Created by Mukesh Rajput on 26/08/24.
//

import Foundation

class LoginVM: ObservableObject {
    
    @Published var loginDC: LoginDC = LoginDC()
    @Published var showAlert: Bool = false
    
    
    func login(){
        showAlert = true
    }
    
}
