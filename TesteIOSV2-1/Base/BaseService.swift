//
//  BaseService.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 11/06/22.
//

import UIKit

enum NetworkError: Error {
    
    case serviceError( error: Error )
    case noData
    case badUrl
    case decoderError
}

class BaseService {
    
    func  request<T:Decodable>(endpoint : String,
                               _ completion: @escaping (_ response: Result<T,NetworkError>) -> Void) {
        
        guard let url = URL(string: Constants.API.BaseURL + endpoint) else {
            completion(.failure(.badUrl))
            return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.serviceError(error: error)))
            }
            if let data = data {
                if let character = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(character))
                } else {
                    print("Invalid Response")
                    completion(.failure(.decoderError))
                }
            }else{
                completion(.failure(.noData))
            }
        }
        
        task.resume()
    }
    
}
