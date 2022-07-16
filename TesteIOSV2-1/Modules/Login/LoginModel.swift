//
//  LoginModel.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//

import Foundation

struct LoginModel: Decodable {
    
    let customerName: String?
    let accountNumber: String?
    let branchNumber: String?
    let checkingAccountBalance: Int?
    let id: String?
    
}
