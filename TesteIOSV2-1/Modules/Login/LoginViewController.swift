//
//  LoginViewController.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 20/05/22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var swUserName: UIView!
    @IBOutlet weak var swPassword: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblLoginStats: UILabel!
    
    var viewModel: LoginViewModelProtocol
    let coordinator: AppCoordinator
    
    init(viewModel: LoginViewModelProtocol, coordinator: AppCoordinator) {
        self.viewModel =  viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tfPassword.delegate = self
        self.tfUserName.delegate = self
        
        configStyle()
        
        addTapGesture()
        
        bindingEvents()
    }
    
    func bindingEvents() {
        viewModel.didLoggedIn = { [weak self] loginModel in
            self?.changeScreen(loginModel)
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
        return true
    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        
        dismissKeyboard()
        if viewModel.login(tfUserName: tfUserName, tfPassword: tfPassword, label: lblLoginStats) {
            viewModel.login()
        }
    }
    
    func changeScreen(_ loginModel: LoginModel) {
        coordinator.goToDashBoard(loginModel)
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
