//
//  UsersPresenter.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
class UsersPresenter {
    weak var view: UsersViewProtocol?
    var router: UsersRouterProtocol?
    
    func goNavigationBack() {
        router?.navigationBack()
    }
    
    func goNavigationGraphic() {
        router?.navigationGraphic()
    }
    
}



extension UsersPresenter: UsersPresenterProtocol {
    
}
