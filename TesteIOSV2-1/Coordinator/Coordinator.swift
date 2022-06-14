//
//  Coordinator.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 07/06/22.
//

import UIKit

protocol Coordinator {
    
    var currentViewController: UIViewController? { get }
    
    func start()
    
}
