//
//  loginUnitTests.swift
//  TesteIOSV2-1Tests
//
//  Created by Paulo Danilo Conceição Lima on 20/06/22.
//

import XCTest
@testable import TesteIOSV2_1

class loginUiTests: TesteIOSV2_1UITests {
    
    
    func testValidadeUI() {
        super.makeInitialrun_launchApp()
    }
    
    func testClickLogin() {
        
        let button = application.buttons["LoginButton"]
        button.tap()
        
    }
    
    func testTextsFields(){
        
        let txtFieldLogin = application.textFields["txtFieldLogin"]
        XCTAssertTrue(txtFieldLogin.exists)
        txtFieldLogin.tap()
        
        txtFieldLogin.typeText("teste@teste.com")
    
        let txtFieldPassword = application.secureTextFields["txtFieldPassword"]
        XCTAssertTrue(txtFieldPassword.exists)
        txtFieldPassword.tap()
        
        txtFieldPassword.typeText("1!aA")
        
    }
}
