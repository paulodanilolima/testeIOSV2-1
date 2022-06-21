//
//  AppCoordinator.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 07/06/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    
    let window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let service = LoginService()
        let viewModel = LoginViewModel(service)
        let viewController = LoginViewController(viewModel: viewModel, coordinator: self)
        
        window.rootViewController = viewController
        
        window.makeKeyAndVisible()
        
        currentViewController = viewController
    }
    
    func goToDashBoard(_ LoginModel: LoginModel){
        
        let service = DashboardService()
        let viewModel = DashboardViewModel(service)
        let viewController = DashboardViewController(viewModel: viewModel, coordinator: self)
        
        currentViewController?.present(viewController, animated: true)
    }
}
