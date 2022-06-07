//
//  LoginViewController.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 20/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var swUserName: UIView!
    @IBOutlet weak var swPassword: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblLoginStats: UILabel!
    
    var login: Login?
    var viewcontroller: UIViewController!
    let upperCase = ["A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","Q","R","S","T","U","V","X","Y","Z"]
    let especialCharacters = [".",",","(",")","!","?","|", "@"]
    let number = ["1","2","3","4","5","6","7","8","9", "0"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfUserName.borderStyle = .none
        tfPassword.borderStyle = .none
        
        swPassword.layer.borderWidth = 1
        swPassword.layer.borderColor = UIColor.gray.cgColor
        
        swUserName.layer.borderWidth = 1
        swUserName.layer.borderColor = UIColor.gray.cgColor
        
        btnLogin.layer.cornerRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        LoginService().loadData { result in
            self.login = result
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if textField == tfUserName {
            return false
        }
        
        if textField == tfPassword {
            loginPressed(btnLogin)
            return  false
        }
        return false
    }

    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        
        dismissKeyboard()

        if tfUserName.text!.isEmpty && tfPassword.text!.isEmpty{
            showLabelLoginStats(str: Constants.FillLoginAndPassword)
        } else if tfUserName.text!.isEmpty {
            showLabelLoginStats(str: Constants.FillLogin)
        }else if tfPassword.text!.isEmpty {
            showLabelLoginStats(str: Constants.FillPassword)
        }else{
            if verifyLoginAndPassword() {
                showLabelLoginStats(str: Constants.SucessLogin)
                changeScreen()
            }else{
                showLabelLoginStats(str: Constants.FailLogin)
            }
        }
    }
    
    func showLabelLoginStats(str: String){
        
        lblLoginStats.text = str
        lblLoginStats.isHidden = false
        
        hideLabelLoginStats()
    }
    
    func hideLabelLoginStats(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.lblLoginStats.isHidden = true
        }
    }
    
    func verifyLoginAndPassword()-> Bool {
        
        let password = tfPassword.text!
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
    
    func changeScreen() {
        let viewcontroller = DashboardViewController()
        self.present(viewcontroller, animated: true)
    }
}
