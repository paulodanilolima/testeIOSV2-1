//
//  LoginViewModel.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//

import Foundation

class LoginViewModel {
    
    let upperCase = ["A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","Q","R","S","T","U","V","X","Y","Z"]
    let especialCharacters = [".",",","(",")","!","?","|", "@"]
    let number = ["1","2","3","4","5","6","7","8","9", "0"]
    var login: Login?
    
    
    func verifyLoginAndPassword(Password: String)-> Bool {
        
        let password = Password
        var count = 0
        
        for char in password {
            
            if upperCase.contains(String(char)){
                count += 1
                break
            }
        }
        
        for char in password {
            
            if especialCharacters.contains(String(char)){
                count += 1
                break
            }
        }
        
        for char in password {
            
            if number.contains(String(char)){
                count += 1
                break
            }
        }
        
        if count >= 3 {
            return true
        }else{
            return false
        }
    }
    
    
}
