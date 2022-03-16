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
    func notifyData(response: [listResponse.__Questions.__ChartData]?)
}

protocol GraphicsInteractorProtocol: class {
    func getGraphics()
    func getData()
}

protocol GraphicsPresenterProtocol: class {
    func requestGraphics()
    func responseData(response: [listResponse.__Questions.__ChartData]?)
    func responseGraphics(response: [listResponse.__Questions]?)
    func goNavigationBack()
}

protocol GraphicsRouterProtocol: class {
    func navigationBack()
}
