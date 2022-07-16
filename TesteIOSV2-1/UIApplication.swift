//
//  UIApplication.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//


import UIKit

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
         
         if let presented = controller?.presentedViewController {
             return topViewController(controller: presented)
         }
         return controller
     }
}
