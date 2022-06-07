//
//  LoginModel.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//

import Foundation

struct Login: Decodable {
    
    var customerName: String?
    var accountNumber: String?
    var branchNumber: String?
    var checkingAccountBalance: Int?
    var id: String?
    
}
