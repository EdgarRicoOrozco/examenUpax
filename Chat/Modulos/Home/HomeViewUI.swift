//
//  HomeViewUI.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

protocol HomeViewUIDelegate {
    func register()
    func users()
}

class HomeViewUI: UIView{
    
    private lazy var navigationBar: UINavigationBar = {
        let navigationController = UINavigationBar(frame: .zero)
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        navigationController.backgroundColor = ColorManager.mainPurple
        return navigationController
    }()
    
    private lazy var contentView: UIScrollView = {
        let scrollview = UIScrollView(frame: .zero)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = ColorManager.colorWhite
        return scrollview
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorManager.mainPurpledis
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "register")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bienvenido"
        label.textColor = ColorManager.mainPurple
        label.font = .boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }() 
    
    private lazy var userBtn: Btn_Default = {
        let button = Btn_Default(titleText: "Consultas", textAlignment: .Center, showIcon: false)
        button.setEnableButton(enable: true)
        button.addTarget(self, action: #selector(userAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var delegate: HomeViewUIDelegate?
    var navigationController: UINavigationController?
    
    public init(
        navigation: UINavigationController,
        delegate: HomeViewUIDelegate){
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
        setupUIElements()
        setupConstraints()      
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupUIElements(){
        self.addSubview(contentView)
        self.addSubview(navigationBar)
        contentView.addSubview(cardView)
        cardView.addSubview(titleIcon)
        cardView.addSubview(titleLabel)
        cardView.addSubview(userBtn)
        
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
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
        cardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        cardView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        cardView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
        cardView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        cardView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
        
        titleIcon.topAnchor.constraint(equalTo: cardView.topAnchor,constant: 40),
        titleIcon.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        titleIcon.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        titleIcon.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant:-30),
        
        titleLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
        titleLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
        titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 40),
        titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -40),
        
        userBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 40),
        userBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        userBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        userBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func userAction(){
        delegate?.users()
    }
    
   

}




