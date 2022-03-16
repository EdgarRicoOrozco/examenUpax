//
//  HomePresenter.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
class HomePresenter {
    var interactor: HomeInteractorProtocol?
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    
    func goToRegister(){
        router?.navigationRegisterUsers()
    }
    
    func goToUsers() {
        router?.navigationToUsers()
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    
}
