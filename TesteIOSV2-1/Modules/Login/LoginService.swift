//
//  LoginService.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//

import UIKit

typealias LoginCompletion = (_ result: Result<LoginModel,NetworkError>) -> Void

protocol LoginServiceDelegate {
    func login(_ completion: @escaping LoginCompletion)
}

final class LoginService: BaseService, LoginServiceDelegate {
    
    func login(_ completion: @escaping LoginCompletion) {
        
        request(endpoint: "/treinamento/Login") { (response: Result<LoginModel,NetworkError>)  in
           completion(response)
        }
    }
  
    
}
