//
//  RegisterUsersRouter.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

class RegisterUsersRouter{
    var navigation: UINavigationController?
    
}

extension RegisterUsersRouter: RegisterUsersRouterProtocol{
    func navigationBack() {
        navigation?.popViewController(animated: true)
    }
    
    
}
