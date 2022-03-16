//
//  GraphicsPresenter.swift
//  Registro
//
//  Created Branchbit on 13/03/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
class GraphicsPresenter {
    var interactor: GraphicsInteractorProtocol?
    weak var view: GraphicsViewProtocol?
    var router: GraphicsRouterProtocol?
    
}



extension GraphicsPresenter: GraphicsPresenterProtocol {
    func responseData(response: [listResponse.__Questions.__ChartData]?) {
        
    }
    
    func responseGraphics(response: [listResponse.__Questions]?) {
        view?.notifyGraphics(response: response)
    }

    func requestGraphics() {
        interactor?.getGraphics()
    }
    
    func goNavigationBack() {
        router?.navigationBack()
    }
}
