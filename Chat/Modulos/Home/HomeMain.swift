//
//  HomeMain.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

open class HomeMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: HomeView? = HomeView()
        if let view = viewController {
            let presenter = HomePresenter()
            let router = HomeRouter()
            
             view.presenter = presenter
            
             presenter.view = view
             presenter.router = router
             
             router.navigation = navigation
             
            return view
        }
        return UIViewController()
    }
    
    
}
