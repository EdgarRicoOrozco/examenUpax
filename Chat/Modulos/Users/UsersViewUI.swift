//
//  UsersViewUI.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//  2022 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

protocol UsersViewUIDelegate {
    func goToBack()
    func goToPhoto()
    func goToGraphics()
}

class UsersViewUI: UIView{
    
    private lazy var navigationBar: UINavigationBar = {
        let navigationController = UINavigationBar(frame: .zero)
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        navigationController.backgroundColor = ColorManager.mainPurple
        return navigationController
    }()
    
    lazy var titleIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "register")
        image.layer.cornerRadius = 15
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Examen iOS"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = ColorManager.colorBlack
        return label
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
    
    lazy var tableUsers: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.keyboardDismissMode = .onDrag
        tableview.backgroundColor = UIColor.clear
        tableview.register(userCell.self, forCellReuseIdentifier: "userCell")
        tableview.layer.cornerRadius = 10
        tableview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        return tableview
    }()
    
    private lazy var backBtn: Btn_Default = {
        let button = Btn_Default(titleText: "Regresar", textAlignment: .Center, showIcon: false)
        button.setEnableButton(enable: true)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var delegate: UsersViewUIDelegate?
    var navigationController: UINavigationController?
    public let temas : Array = ["Nombre","Selfie","Graficas"]
    
    public convenience init(
        navigation: UINavigationController,
        delegate: UsersViewUIDelegate){
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
    
    fileprivate func setupUIElements () {
        self.addSubview(navigationBar)
        self.addSubview(contentView)
        contentView.addSubview(cardView)
        cardView.addSubview(titleIcon)
        cardView.addSubview(titleLabel)
        cardView.addSubview(tableUsers)
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
        titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
        titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
        titleLabel.heightAnchor.constraint(equalToConstant: 50),
        
        titleIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
        titleIcon.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
        titleIcon.widthAnchor.constraint(equalToConstant: 120),
        titleIcon.heightAnchor.constraint(equalToConstant: 120),
        
        tableUsers.topAnchor.constraint(equalTo: titleIcon.bottomAnchor,constant: 10),
        tableUsers.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        tableUsers.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        tableUsers.bottomAnchor.constraint(equalTo: cardView.bottomAnchor,constant: -70),
        
        backBtn.bottomAnchor.constraint(equalTo: cardView.bottomAnchor,constant: -50),
        backBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 20),
        backBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20),
        backBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func back(){
        delegate?.goToBack()
    }

}

extension UsersViewUI: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! userCell
        cell.tag = indexPath.row
        cell.updateInfoToShow()
        switch indexPath.row{
            case 1:
                cell.actionBtn.addTarget(self, action: #selector(actionPhoto(_:)), for: .touchUpInside)
             //   delegate?.goToBack()
            case 2:
                cell.actionBtn.addTarget(self, action: #selector(goToGrafics(_:)), for: .touchUpInside)
            default:
                print("Default")
            }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temas.count
    }
    
    @objc func actionPhoto(_ sender: UIButton){
        delegate?.goToPhoto()
    }
    
    @objc func goToGrafics(_ sender: UIButton){
        delegate?.goToGraphics()
    }

}
extension UsersViewUI: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}




