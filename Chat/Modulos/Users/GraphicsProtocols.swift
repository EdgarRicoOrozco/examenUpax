//
//  GraphicsProtocols.swift
//  Registro
//
//  Created Branchbit on 13/03/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
protocol GraphicsViewProtocol: class {
    func notifyGraphics(response: [listResponse.__Questions]?)
}

protocol GraphicsInteractorProtocol: class {
    func getGraphics()
}

protocol GraphicsPresenterProtocol: class {
    func requestGraphics()
    func responseGraphics(response: [listResponse.__Questions]?)
}

protocol GraphicsRouterProtocol: class {
    
}
