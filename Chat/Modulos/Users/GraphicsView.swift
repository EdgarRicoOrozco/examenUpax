//
//  GraphicsView.swift
//  Registro
//
//  Created Branchbit on 13/03/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
class GraphicsView: UIViewController {
    
    var presenter: GraphicsPresenterProtocol?
    private var ui: GraphicsViewUI?
    
    
    override func loadView() {
        ui = GraphicsViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        
        
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        presenter?.requestGraphics()
        
    }
    
}

extension GraphicsView: GraphicsViewProtocol {
    func notifyData(response: [listResponse.__Questions.__ChartData]?) {
        
    }
    
    func goToBack() {
        presenter?.goNavigationBack()
    }
    
    func notifyGraphics(response: [listResponse.__Questions]?) {
        var mapping : [Questions] = []
        var mappingdata : [ChartData] = []
        let preguntas: Int = response?.count ?? 0
        GraphicsData.PreguntasNumero = preguntas
        
        for ma in response ?? [] {
            mapping.append(Questions(total: ma.total, text: ma.text))
            GraphicsData.Preguntas.append(ma.text ?? "")
        }
    
        ui?.Questions = response
    }
    
    func notifyData(response: [listResponse.__Questions.__ChartData]) {

    }
    
    func showLoading() {
        DispatchQueue.main.async {
            UILoader.show(parent: self.view)
        }
    }
    
    func dissmissLoading() {
        DispatchQueue.main.async {
            
            UILoader.remove(parent: self.view)
        }
    }
    
}

open class GraphicsData {
    public static var PreguntasNumero: Int?
    public static var Preguntas : [String] = []
}

extension GraphicsView: GraphicsViewUIDelegate {
    
    
    
}
