//
//  UsersRouter.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

class UsersRouter{
    var navigation: UINavigationController?
    
}

extension UsersRouter: UsersRouterProtocol{
    func navigationBack() {
        navigation?.popViewController(animated: true)
    }
    
    func navigationGraphic() {
        let controller = GraphicsMain.createModule(navigation: self.navigation!)
        navigation?.pushViewController(controller, animated: true)
    }
}
