//
//  UsersView.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
class UsersView: UIViewController, popupGenericProtocol{
    
    
    var presenter: UsersPresenterProtocol?
    private var ui: UsersViewUI?
    
    
    override func loadView() {
        ui = UsersViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    
}

extension UsersView: UsersViewProtocol {
    func goToBack() {
        presenter?.goNavigationBack()
    }
    
    func goToGraphics() {
        presenter?.goNavigationGraphic()
    }
    
    func goToPhoto() {
        _ = popupGeneric(parent: self,
                        delegate: self,
                        title: "Aviso",
                        message: "Recuerda que debe ser visible tu fotografia.",
                        showOptionalButton: true,
                        optionalButtonTitleText: "Regresar")
    }
    
    func notifyAccept() {
        notifyCameraClicked()
    }
    
    func notifyOptionalAccept() {
        print("Opcional")
    }
    
    func notifyCameraClicked() {
        UsersView.showImagePicker(presenter: self)
    }
    
}

extension UsersView: UsersViewUIDelegate{
    
    public static func showImagePicker(presenter: UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
        let alert = UIAlertController(title: "Selecciona", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cámara", style: .default, handler: { _ in
            self.openCamera(presenter: presenter)
        }))

        alert.addAction(UIAlertAction(title: "Galería", style: .default, handler: { _ in
            self.openGallery(presenter: presenter)
        }))

        alert.addAction(UIAlertAction.init(title: "Cancelar", style: .cancel, handler: nil))

        presenter.present(alert, animated: true, completion: nil)
    }
    
    private static func openCamera(presenter: UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = presenter
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            presenter.present(imagePicker, animated: true)
        } else {
            let alert  = UIAlertController(title: "Alerta", message: "No cuentas con cámara", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            presenter.present(alert, animated: true)
        }
    }

    private static func openGallery(presenter: UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = presenter
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            imagePicker.modalPresentationStyle = .overFullScreen
            presenter.present(imagePicker, animated: true)
        } else {
            let alert  = UIAlertController(title: "Alerta", message: "La aplicación no tiene permisos para acceder a la galería.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            presenter.present(alert, animated: true)
        }
    }
}

extension UsersView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        if picker.sourceType != .camera {
            let assetPath = info[UIImagePickerController.InfoKey.imageURL] as? NSURL
            guard (assetPath?.absoluteString?.lowercased().hasSuffix("jpg") == true ||
                   assetPath?.absoluteString?.lowercased().hasSuffix("jpeg") == true ||
                   assetPath?.absoluteString?.lowercased().hasSuffix("png") == true) else{
                _ = popupGeneric(parent: self, delegate: nil, title: "Información", message: "Formato de fotografía no válida, intente nuevamente o con una foto diferente en formato png, jpeg ó jpg")
                return
            }
        }

        guard let image = info[.editedImage] as? UIImage, let imageData = image.jpegData(compressionQuality: 1) else {
            _ = popupGeneric(parent: self, delegate: nil, title: "Información", message: "Fotografía no válida, intente nuevamente o con una foto diferente")
            return
        }

        if (Double(NSData(data: imageData).count) / 1000) > 1600.0 {
            self.ui?.titleIcon.image = image.resizedTo1MB()
            self.ui?.titleIcon.isHidden = false
        }else{
            self.ui?.titleIcon.image = image
            self.ui?.titleIcon.isHidden = false
        }
    }
}

