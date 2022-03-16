//
//  RegisterUsersView.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
//import Microblink

class RegisterUsersView: UIViewController {
    var presenter: RegisterUsersPresenterProtocol?
    private var ui: RegisterUsersViewUI?
    //var blinkIdRecognizer: MBBlinkIdCombinedRecognizer?
    
    
    override func loadView() {
        ui = RegisterUsersViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    
}

extension RegisterUsersView: RegisterUsersViewProtocol {
    
}

extension RegisterUsersView: RegisterUsersViewUIDelegate {
    func goScan() {
        
    }
    
    func clean(){
        ui?.phoneTextfield.text = ""
        ui?.emailTextfield.text = ""
        ui?.lastNameMTextfield.text = ""
        ui?.lastNameFTextfield.text = ""
        ui?.nameTextfield.text = ""
        ui?.saveBtn.setEnableButton(enable: false)
    }
    
    func saveToUser() {
      
        
        let alerta = UIAlertController(title: "Aviso",
                                       message: "Usuario registrado exitoxamente.",
                                       preferredStyle: UIAlertController.Style.alert)
        let accion = UIAlertAction(title: "Cerrar",
                                   style: UIAlertAction.Style.default) { _ in
        alerta.dismiss(animated: true, completion: nil) };
        alerta.addAction(accion)
        self.present(alerta, animated: true, completion: nil)
        clean()
            }
    
    func goBack() {
        presenter?.goNavigationBack()
    }
    
}
