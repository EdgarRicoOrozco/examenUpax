//
//  RegisterUsersViewUI.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
//import Microblink

protocol RegisterUsersViewUIDelegate {
    func goBack()
    func goScan()
    func saveToUser()
}

class RegisterUsersViewUI: UIView{
    
    var navigation: UINavigationController?
    
    private lazy var navigationBar: UINavigationBar = {
        let navigationController = UINavigationBar(frame: .zero)
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        navigationController.backgroundColor = ColorManager.mainPurple
        return navigationController
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registro"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = ColorManager.colorBlack
        return label
    }()
    
    private lazy var toolBar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100.0, height: 44.0))
        let botonAceptar = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(finishEditing))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        botonAceptar.tag = 0
        toolbar.setItems([spacer,botonAceptar], animated: true)
        return toolbar
    }()
    
    private lazy var contentView: UIScrollView = {
        let scrollview = UIScrollView(frame: .zero)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = ColorManager.colorWhite
        return scrollview
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = ColorManager.mainPurpledis
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nombre"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = ColorManager.colorBlack
        return label
    }()
    
    private lazy var scanBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(ColorManager.mainBlue, for: .normal)
        button.setTitle("Rellenar con ID", for: .normal)
        button.addTarget(self, action: #selector(scan), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var nameTextfield: UITextField = {
        let textfiel = UITextField()
        textfiel.textColor = .black
        textfiel.backgroundColor = ColorManager.colorWhite
        textfiel.keyboardType = .asciiCapable
        textfiel.layer.cornerRadius = 10
        textfiel.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfiel.leftViewMode = .always
        textfiel.inputAccessoryView = toolBar
        textfiel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfiel.translatesAutoresizingMaskIntoConstraints = false
        return textfiel
    }()
    
    private lazy var lastNameFLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Apellido paterno"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = ColorManager.colorBlack
        return label
    }()
    
    lazy var lastNameFTextfield: UITextField = {
        let textfiel = UITextField()
        textfiel.textColor = .black
        textfiel.backgroundColor = ColorManager.colorWhite
        textfiel.keyboardType = .asciiCapable
        textfiel.layer.cornerRadius = 10
        textfiel.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfiel.leftViewMode = .always
        textfiel.inputAccessoryView = toolBar
        textfiel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfiel.translatesAutoresizingMaskIntoConstraints = false
        return textfiel
    }()
    
    private lazy var lastNameMLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Apellido materno"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = ColorManager.colorBlack
        return label
    }()
    
    lazy var lastNameMTextfield: UITextField = {
        let textfiel = UITextField()
        textfiel.textColor = .black
        textfiel.backgroundColor = ColorManager.colorWhite
        textfiel.keyboardType = .asciiCapable
        textfiel.layer.cornerRadius = 10
        textfiel.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfiel.leftViewMode = .always
        textfiel.inputAccessoryView = toolBar
        textfiel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfiel.translatesAutoresizingMaskIntoConstraints = false
        return textfiel
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Correo electronico"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = ColorManager.colorBlack
        return label
    }()
    
    lazy var emailTextfield: UITextField = {
        let textfiel = UITextField()
        textfiel.textColor = .black
        textfiel.backgroundColor = ColorManager.colorWhite
        textfiel.keyboardType = .asciiCapable
        textfiel.layer.cornerRadius = 10
        textfiel.leftViewMode = .always
        textfiel.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfiel.inputAccessoryView = toolBar
        textfiel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfiel.translatesAutoresizingMaskIntoConstraints = false
        return textfiel
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Telefono celular"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = ColorManager.colorBlack
        return label
    }()
    
    lazy var phoneTextfield: UITextField = {
        let textfiel = UITextField()
        textfiel.textColor = .black
        textfiel.backgroundColor = ColorManager.colorWhite
        textfiel.keyboardType = .numberPad
        textfiel.layer.cornerRadius = 10
        textfiel.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfiel.leftViewMode = .always
        textfiel.inputAccessoryView = toolBar
        textfiel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textfiel.translatesAutoresizingMaskIntoConstraints = false
        return textfiel
    }()
    
    lazy var saveBtn: Btn_Default = {
        let button = Btn_Default(titleText: "Guardar", textAlignment: .Center, showIcon: false)
        button.setEnableButton(enable: false)
        button.addTarget(self, action: #selector(saveToUser), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var backBtn: Btn_Default = {
        let button = Btn_Default(titleText: "Regresar", textAlignment: .Center, showIcon: false)
        button.setEnableButton(enable: true)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var delegate: RegisterUsersViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController,
        delegate: RegisterUsersViewUIDelegate){
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
        setupUIElements()
        setupConstraints()
        valideMicroblink()
            
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func valideMicroblink(){
//        var licenseErrorMessage = ""
//        MBMicroblinkSDK.shared().setLicenseKey("sRwAAAEHQVMuQ2hhdLUHWqOVb7JjHNhLCMP/UVD+hloefXQaxO6INkrSPOxksN51Jf/gLKH8/XAaNyEfwsDS9jrAeAkutlolW5skf2TxAm5ceLJf+XufUDglPaz0mA2YTGZgkTFY/M2dXTfXGVdRzrssmgG4arGBQbHKzZIkih6XiEBlHQAXcZJF2atyGLfgsHxwXCsD3CChuanmTa6GTb8vvJ6uxTaomzZ887BQb1ZcfWqFJlNz74DKu2Bb")
//        { (licenseError) in
//            switch licenseError {
//            case .invalidLicense:
//                licenseErrorMessage = "Invalid license"
//            case .networkRequired:
//                licenseErrorMessage = "Network required"
//            case .unableToDoRemoteLicenceCheck:
//                licenseErrorMessage = "Unable to do remote license check"
//            case .licenseIsLocked:
//                licenseErrorMessage = "License is locked"
//            case .licenseCheckFailed:
//                licenseErrorMessage = "License check failed"
//            @unknown default:
//                licenseErrorMessage = "Unknown error"
//            }
//        }
    }
    
    fileprivate func setupUIElements(){
        self.addSubview(contentView)
        self.addSubview(navigationBar)
        contentView.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(nameLabel)
        cardView.addSubview(scanBtn)
        cardView.addSubview(nameTextfield)
        cardView.addSubview(lastNameFLabel)
        cardView.addSubview(lastNameFTextfield)
        cardView.addSubview(lastNameMLabel)
        cardView.addSubview(lastNameMTextfield)
        cardView.addSubview(emailLabel)
        cardView.addSubview(emailTextfield)
        cardView.addSubview(phoneLabel)
        cardView.addSubview(phoneTextfield)
        cardView.addSubview(saveBtn)
        cardView.addSubview(backBtn)
    }
    
    fileprivate func setupConstraints(){
        NSLayoutConstraint.activate([
        navigationBar.topAnchor.constraint(equalTo: self.topAnchor),
        navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
        contentView.topAnchor.constraint(equalTo: self.navigationBar.bottomAnchor),
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ///CardView
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
        cardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10),
        cardView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -10),
        cardView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
        cardView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        cardView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
        
        titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor,constant: 20),
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        titleLabel.heightAnchor.constraint(equalToConstant: 50),
        titleLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor,constant: -30),
        
        nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
        nameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        
        nameTextfield.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 5),
        nameTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        nameTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        nameTextfield.heightAnchor.constraint(equalToConstant: 30),
        
        lastNameFLabel.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor, constant: 10),
        lastNameFLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        lastNameFLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        
        lastNameFTextfield.topAnchor.constraint(equalTo: lastNameFLabel.bottomAnchor,constant: 5),
        lastNameFTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        lastNameFTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        lastNameFTextfield.heightAnchor.constraint(equalToConstant: 30),
        
        lastNameMLabel.topAnchor.constraint(equalTo: lastNameFTextfield.bottomAnchor, constant: 10),
        lastNameMLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        lastNameMLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        
        lastNameMTextfield.topAnchor.constraint(equalTo: lastNameMLabel.bottomAnchor,constant: 5),
        lastNameMTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        lastNameMTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        lastNameMTextfield.heightAnchor.constraint(equalToConstant: 30),

        emailLabel.topAnchor.constraint(equalTo: lastNameMTextfield.bottomAnchor, constant: 10),
        emailLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        emailLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        
        emailTextfield.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 5),
        emailTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        emailTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        emailTextfield.heightAnchor.constraint(equalToConstant: 30),
        
        phoneLabel.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 10),
        phoneLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        phoneLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        
        phoneTextfield.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor,constant: 5),
        phoneTextfield.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        phoneTextfield.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        phoneTextfield.heightAnchor.constraint(equalToConstant: 30),
        
        scanBtn.topAnchor.constraint(equalTo: phoneTextfield.bottomAnchor,constant: 20),
        scanBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        scanBtn.heightAnchor.constraint(equalToConstant: 20),
        scanBtn.widthAnchor.constraint(equalToConstant: 150),
        
        saveBtn.bottomAnchor.constraint(equalTo: backBtn.topAnchor,constant: -30),
        saveBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        saveBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        saveBtn.heightAnchor.constraint(equalToConstant: 50),
        
        backBtn.bottomAnchor.constraint(equalTo: cardView.bottomAnchor,constant: -30),
        backBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        backBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        backBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc func textFieldDidChange(_ textField: UITextField){
        if ((self.nameTextfield.text?.count ?? 0 >= 1) && (self.lastNameMTextfield.text?.count ?? 0 >= 1) && (self.lastNameFTextfield.text?.count ?? 0 >= 1) && ( self.emailTextfield.text?.count ?? 0 >= 1) && (self.phoneTextfield.text?.count ?? 0 == 10)) {
            saveBtn.setEnableButton(enable: true)
        }else {
            saveBtn.setEnableButton(enable: false)
        }
        
    }
    
    @objc func finishEditing(){
        self.endEditing(true)
    }
    
    @objc func back(){
        delegate?.goBack()
    }
    
    @objc func scan(){
        delegate?.goScan()
    }
    
    @objc func saveToUser(){
        delegate?.saveToUser()
    }
    

}




