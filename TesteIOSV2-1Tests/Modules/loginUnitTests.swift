//
//  loginUnitTests.swift
//  TesteIOSV2-1Tests
//
//  Created by Paulo Danilo Conceição Lima on 20/06/22.
//

import XCTest
@testable import TesteIOSV2_1

class loginUnitTests: TesteIOSV2_1Tests, LoginServiceDelegate {
    
    func login(_ completion: @escaping LoginCompletion) {}

    var viewModel = LoginViewModel(nil)
    
    override func setUp() {
        super.setUp()
        
    }
    
    
    func testVerifyLoginAndPassword(){
        
        let result = viewModel.verifyLoginAndPassword(Password: "1!aA")
        
        XCTAssertTrue(result)
    }
    
    func testLogin() {
        
        let txtLogin: UITextField!
        let txtPassword: UITextField!
        let lblStats: UILabel!
        
        txtLogin = UITextField()
        txtPassword = UITextField()
        lblStats = UILabel()
        
        txtLogin.text = "login@test.com"
        txtPassword.text = "1!aA"
        
        let result = viewModel.login(tfUserName: txtLogin, tfPassword: txtPassword, label: lblStats)
        
        XCTAssertTrue(result)
    }
    
//    func testLoginAPI(){
//
//        viewModel.login()
//
//        let result =  viewModel.loginModel
//
//        XCTAssertNotNil(result)
//        
//    }

    

}
