//
//  UserCell.swift
//  Registro
//
//  Created by Edgar Rico on 26/02/22.
//

import UIKit

class userCell: UITableViewCell {

    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorManager.colorWhite
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var toolBar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100.0, height: 44.0))
        let botonAceptar = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(finishEditing))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        botonAceptar.tag = 0
        toolbar.setItems([spacer,botonAceptar], animated: true)
        return toolbar
    }()
    
    private lazy var overLine: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorManager.colorBlack
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.text = "Nombre"
        label.textColor = ColorManager.colorBlack
        return label
    }()
    
    lazy var nameTextfield : UITextField = {
        let textfiel = UITextField(frame: .zero)
        textfiel.textColor = .black
        textfiel.backgroundColor = ColorManager.mainPurpledis
        textfiel.keyboardType = .asciiCapable
        textfiel.layer.cornerRadius = 10
        textfiel.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textfiel.leftViewMode = .always
        textfiel.placeholder = "Nombre"
        textfiel.inputAccessoryView = toolBar
        textfiel.translatesAutoresizingMaskIntoConstraints = false
        return textfiel
    }()
    
    lazy var actionBtn: Btn_Default = {
        let button = Btn_Default(titleText: "IR A GRAFICAS", textAlignment: .Center, showIcon: false)
        button.setEnableButton(enable: true)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = ColorManager.colorWhite
        setupUIElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUIElements() {
        contentView.addSubview(containerView)
        containerView.addSubview(overLine)
        containerView.addSubview(nameLabel)
        containerView.addSubview(nameTextfield)
        containerView.addSubview(actionBtn)
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            overLine.topAnchor.constraint(equalTo: containerView.topAnchor),
            overLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            overLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            overLine.heightAnchor.constraint(equalToConstant: 1),
            
            nameLabel.topAnchor.constraint(equalTo: overLine.bottomAnchor,constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            
            nameTextfield.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 5),
            nameTextfield.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            nameTextfield.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            nameTextfield.heightAnchor.constraint(equalToConstant: 40),
            
            actionBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            actionBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            actionBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            actionBtn.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
    }
    
    @objc func finishEditing(){
        self.endEditing(true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateInfoToShow(){
        
        switch tag{
        case 0:
            nameLabel.isHidden = false
            nameTextfield.isHidden = false
            actionBtn.isHidden = true
        case 1:
            nameLabel.isHidden = true
            nameTextfield.isHidden = true
            actionBtn.setTitle("Tomar una selfie", for: .normal)
            actionBtn.isHidden = false
        case 2:
            nameLabel.isHidden = true
            nameTextfield.isHidden = true
            actionBtn.setTitle("Ir a graficas", for: .normal)
            actionBtn.isHidden = false
        default:
            nameLabel.isHidden = true
            nameTextfield.isHidden = true
            actionBtn.isHidden = true
        }
        
    }

}
