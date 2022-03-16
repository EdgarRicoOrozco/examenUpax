//
//  UsersMain.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

open class UsersMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: UsersView? = UsersView()
        if let view = viewController {
            let presenter = UsersPresenter()
            let router = UsersRouter()
            
             view.presenter = presenter
             
             presenter.view = view
             presenter.router = router
             
             router.navigation = navigation
             
            return view
        }
        return UIViewController()
    }
    
}
