//
//  HomeRouter.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

class HomeRouter{
    var navigation: UINavigationController?
    func navigationRegisterUsers(){
    }
    
    func navigationToUsers(){
        let controller = UsersMain.createModule(navigation: self.navigation!)
        navigation?.pushViewController(controller, animated: true)
    }
}

extension HomeRouter: HomeRouterProtocol{
    
}
