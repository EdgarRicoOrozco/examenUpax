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
        
        presenter?.requestGraphics()
        view = ui
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension GraphicsView: GraphicsViewProtocol {
    func notifyGraphics(response: [listResponse.__Questions]?) {
        guard response?.count != 0 else {
            ui?.Questions = []
            return
        }
        ui?.Questions = response
    }
}

open class date {
    public static var quesone : [CGFloat] = []
}

extension GraphicsView: GraphicsViewUIDelegate {
    
}
