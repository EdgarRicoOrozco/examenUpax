//
//  GraphicsMain.swift
//  Registro
//
//  Created Branchbit on 13/03/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

open class GraphicsMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: GraphicsView? = GraphicsView()
        if let view = viewController {
            let presenter = GraphicsPresenter()
            let router = GraphicsRouter()
            let interactor = GraphicsInteractor()
            
            
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
