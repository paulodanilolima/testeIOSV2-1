//
//  LoginViewModel.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//

import Foundation
import UIKit

protocol LoginViewModelProtocol {
    func verifyLoginAndPassword(Password: String)-> Bool
    func login()
    func login(tfUserName: UITextField, tfPassword: UITextField, label: UILabel) -> Bool
    var didLoggedIn: ((_ loginModel: LoginModel)->Void)? { get set }
}

class LoginViewModel: LoginViewModelProtocol {

    var didLoggedIn: ((_ loginModel: LoginModel)->Void)?
    
    let service: LoginServiceProtocol?
    
    init(_ service: LoginServiceProtocol?) {
        self.service = service
    }
    
    let upperCase = ["A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","Q","R","S","T","U","V","X","Y","Z"]
    let especialCharacters = [".",",","(",")","!","?","|", "@"]
    let number = ["1","2","3","4","5","6","7","8","9", "0"]
    var loginModel: LoginModel?
    
    
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
    
    func login(){
        
        service?.login { [weak self] (result) in
            
            switch result {
            case .success(let model):
                self?.loginModel = model
                self?.didLoggedIn?(model)
                break
            case .failure(let error):
                print(error)
                break
            }
            
        }
    }
    
    func login(tfUserName: UITextField, tfPassword: UITextField, label: UILabel) -> Bool{
        
        if tfUserName.text!.isEmpty && tfPassword.text!.isEmpty{
            showLabelLoginStats(str: Constants.FillLoginAndPassword, label: label)
            return false
        } else if tfUserName.text!.isEmpty {
            showLabelLoginStats(str: Constants.FillLogin, label: label)
            return false
        }else if tfPassword.text!.isEmpty {
            showLabelLoginStats(str: Constants.FillPassword, label: label)
            return false
        }else{
            if verifyLoginAndPassword(Password: tfPassword.text ?? "") {
                showLabelLoginStats(str: Constants.SucessLogin, label: label)
                return true
            }else{
                showLabelLoginStats(str: Constants.FailLogin, label: label)
                return false
            }
        }
    }
    
    func showLabelLoginStats(str: String, label: UILabel){
        
        label.text = str
        label.isHidden = false
        
        hideLabelLoginStats(label)
    }
    
    func hideLabelLoginStats(_ label: UILabel){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            label.isHidden = true
        }
    }
    
    
}
