//
//  BaseService.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 11/06/22.
//

import UIKit

class BaseService {
    
    func  request<T:Decodable>(endpoint : String,
                              responseType: T.Type,
                              _ completion: @escaping (_ response: Any?) -> Void) {
        
        let url = URL(string: Constants.API.BaseURL + endpoint)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                    if let character = try? JSONDecoder().decode(responseType.self, from: data) {
            
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
