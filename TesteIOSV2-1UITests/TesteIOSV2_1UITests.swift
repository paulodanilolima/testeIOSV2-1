//
//  TesteIOSV2_1UITests.swift
//  TesteIOSV2-1UITests
//
//  Created by Paulo Danilo Conceição Lima on 12/05/22.
//

import XCTest

class TesteIOSV2_1UITests: XCTestCase {

    let application = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        application.launchArguments.append("RUNNING_TESTS")
        application.launch()
    }
    
    override func tearDown() {
        
        application.terminate()
        
        super.tearDown()
    }
    
    func dismissKeyboard() {
        
        application.keyboards.buttons["retorno"].tap()
    }
    
    
    //------------------------------------------------------------------------------------------
    // MARK: - Inital
    //------------------------------------------------------------------------------------------
    
    func makeInitialrun_launchApp(){
        application.launch()
    }
    
    func makeInitialrun_RootToDashboard() {
        
        let txtFieldLogin = application.textFields["txtFieldLogin"]
        XCTAssertTrue(txtFieldLogin.exists)
        txtFieldLogin.tap()
        txtFieldLogin.typeText("teste@teste.com")
        dismissKeyboard()
        
        
        let txtFieldPassword = application.secureTextFields["txtFieldPassword"]
        XCTAssertTrue(txtFieldPassword.exists)
        txtFieldPassword.tap()
        txtFieldPassword.typeText("1!aA")
        dismissKeyboard()
        
        let button = application.buttons["LoginButton"]
        button.tap()
    }
}
