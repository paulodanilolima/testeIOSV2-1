//
//  DashboardService.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//

import UIKit

typealias DashboardCompletion = (_ result: Result<[Bills],NetworkError>) -> Void

protocol DashboardServiceDelegate {
    func loadData(_ completion: @escaping DashboardCompletion)
}

class DashboardService: BaseService, DashboardServiceDelegate {
    
    var dataBills: [Bills] = []
  
    func loadData(_ completion: @escaping DashboardCompletion){
        
//        request(endpoint: "/treinamento/payments", responseType: [Bills].self) { [self] response in
//            self.dataBills = response as! [Bills]
//            completion(self.dataBills)
//        }
//        
    }
    
}

