//
//  RegisterUsersPresenter.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
class RegisterUsersPresenter {
    var interactor: RegisterUsersInteractorProtocol?
    weak var view: RegisterUsersViewProtocol?
    var router: RegisterUsersRouterProtocol?
    
}



extension RegisterUsersPresenter: RegisterUsersPresenterProtocol {
    func goNavigationBack() {
        router?.navigationBack()
    }
    
    
}
