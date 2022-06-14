//
//  DashboardService.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//

import UIKit


class DashboardService: BaseService {
    
    var dataBills: [Bills] = []
  
    func loadData(_ completion: @escaping (_ result: [Bills]) -> Void) {
        
        request(endpoint: "/treinamento/payments", responseType: [Bills].self) { [self] response in
            self.dataBills = response as! [Bills]
            completion(self.dataBills)
        }
        
    }
    
}

