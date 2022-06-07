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
    
    var viewcontroller: UIViewController!
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configStyle()
        
        addTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        LoginService().loadData { [weak self] result in
            self!.viewModel.login = result
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
            if viewModel.verifyLoginAndPassword(Password: tfPassword.text ?? "") {
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
    
    func changeScreen() {
        let viewcontroller = DashboardViewController()
        self.present(viewcontroller, animated: true)
    }
    
    //----------------------------------------------------
    // MARK: - configStyle()
    //----------------------------------------------------
    
    func configStyle() {
        //Removendo Borda dos Texts Fields
        tfUserName.borderStyle = .none
        tfPassword.borderStyle = .none
        
        //Criando a borda das views dos textsFields de PassWord
        swPassword.layer.borderWidth = 1
        swPassword.layer.borderColor = UIColor.gray.cgColor
        
        //Criando a borda das views dos textsFields de Login
        swUserName.layer.borderWidth = 1
        swUserName.layer.borderColor = UIColor.gray.cgColor
        
        //Definindo as curvas do botão de login
        btnLogin.layer.cornerRadius = 8
    }
    
    //----------------------------------------------------
    // MARK: - addTapGesture()
    //----------------------------------------------------
    
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
