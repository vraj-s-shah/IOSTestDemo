//
//  AuthenticationViewModel.swift
//  IOSTestDemo
//
//  Created by Vraj Shah on 26/08/22.
//

import Foundation

class UserViewModel {
    
    func validateSignupCredentials(signupModel: SignupModel) -> Bool {
        if (signupModel.name.isEmpty) {
            return false
        } else if (signupModel.email.isEmpty) {
            return false
        } else if (!isValidEmail(inputString: signupModel.email)){
            return false
        } else if (signupModel.password.isEmpty){
            return false
        }
        return true
    }
    
    func isValidEmail(inputString: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: inputString)
        return result
    }
}
