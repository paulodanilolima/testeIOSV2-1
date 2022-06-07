//
//  DashboardService.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//

import UIKit


class DashboardService {
  
    
    func loadData(_ completion: @escaping (_ result: [Bills]) -> Void) {
        
        let url = URL(string: "https://60bd336db8ab3700175a03b3.mockapi.io/treinamento/payments")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                    if let character = try? JSONDecoder().decode([Bills].self, from: data) {
            
                        completion(character)
                    } else {
                        print("Invalid Response")
                    }
                } else if let error = error {
                    print("HTTP Request Failed \(error)")
                }
        }
        
        task.resume()
    }
    
}

