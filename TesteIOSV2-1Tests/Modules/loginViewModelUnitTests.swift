//
//  loginUnitTests.swift
//  TesteIOSV2-1Tests
//
//  Created by Paulo Danilo Conceição Lima on 20/06/22.
//

import XCTest
@testable import TesteIOSV2_1

class loginViewModelUnitTests: TesteIOSV2_1Tests, LoginServiceProtocol {
    
    func login(_ completion: @escaping LoginCompletion) {}

    var viewModel = LoginViewModel(nil)
    
    var spy = loginServiceSpy()
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel(spy)
    }
    
    class loginServiceSpy: LoginServiceProtocol {
        
        var loginCalled: Bool = false
        var isSucess: Bool = false
        
        func login(_ completion: @escaping LoginCompletion) {
            loginCalled = true
            
            if isSucess {
                completion(.success(Mocks.loginModel))
            }else{
                completion(.failure(.noData))
            }
        }
        
        
    }
    
    func testVerifyLoginAndPassword(){
        
        let result = viewModel.verifyLoginAndPassword(Password: "1!aA")
        
        XCTAssertTrue(result)
    }
    
    func testVerifyLoginAndPasswordFailNoUppercaseLetter() {
        
        let result = viewModel.verifyLoginAndPassword(Password: "1!aa")
        
        XCTAssertFalse(result)
    }
    
    func testVerifyLoginAndPasswordNoNumber() {
        
        let result = viewModel.verifyLoginAndPassword(Password: "a!aA")
        
        XCTAssertFalse(result)
    }
    
    func testVerifyLoginAndPasswordNoSpecialCaracter() {
        
        let result = viewModel.verifyLoginAndPassword(Password: "11aA")
        
        XCTAssertFalse(result)
    }
    
    func testLogin() {
        //Given
        
        spy.isSucess = true
        var didLoggedInCalled = false
        
        viewModel.didLoggedIn =  {_ in
            didLoggedInCalled = true
        }
        
        //When
        viewModel.login()
        
        //Then
        XCTAssertNotNil(viewModel.loginModel)
        XCTAssertEqual(viewModel.loginModel?.customerName, "Paulo")
        XCTAssertEqual(viewModel.loginModel?.branchNumber, "1242432")
        XCTAssertEqual(viewModel.loginModel?.accountNumber, "100212312")
        XCTAssertEqual(viewModel.loginModel?.checkingAccountBalance, 100000000000000)
        XCTAssertEqual(viewModel.loginModel?.id, "31343243")
        XCTAssertTrue(didLoggedInCalled)
        XCTAssertTrue(spy.loginCalled)
    }
}
