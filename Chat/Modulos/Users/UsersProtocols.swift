//
//  UsersProtocols.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
protocol UsersViewProtocol: class {
    
}

protocol UsersPresenterProtocol: class {
    func goNavigationBack()
    func goNavigationGraphic()
}

protocol UsersRouterProtocol: class {
    func navigationBack()
    func navigationGraphic()
}
