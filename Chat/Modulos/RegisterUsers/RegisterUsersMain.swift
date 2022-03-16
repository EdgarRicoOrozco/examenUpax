//
//  RegisterUsersMain.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

open class RegisterUsersMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: RegisterUsersView? = RegisterUsersView()
        if let view = viewController {
            let presenter = RegisterUsersPresenter()
            let router = RegisterUsersRouter()
            let interactor = RegisterUsersInteractor()
            
            
             view.presenter = presenter
             
             presenter.view = view
             presenter.interactor = interactor
             presenter.router = router
             
             router.navigation = navigation
             
             interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
    
    
}
