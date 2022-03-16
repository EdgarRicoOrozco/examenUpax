//
//  HomeProtocols.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
protocol HomeViewProtocol: class {
    
}

protocol HomeInteractorProtocol: class {
    
}

protocol HomePresenterProtocol: class {
    func goToRegister()
    func goToUsers()
}

protocol HomeRouterProtocol: class {
    func navigationRegisterUsers()
    func navigationToUsers()
}
