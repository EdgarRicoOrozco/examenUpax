//
//  Btn_Default.swift
//  Registro
//
//  Created by Branchbit on 25/02/22.
//

import Foundation
import UIKit

public enum ContentAlignment{
    case Left
    case Center
    //case Right
}

open class Btn_Default: BtnGradient{
    

    var defaultBackgroundColor: UIColor?
    var defaultSecondBackgroundColor: UIColor?
    var defaultTintColor: UIColor?
    var defaultShadowColor: UIColor?
    var defaultDisabledBackgroundColor: UIColor?
    var defaultDisabledTintColor: UIColor?
    var defaultDisabledShadowColor: UIColor?
    var arrowIcon: UIImage = UIImage()
    
    public var showIcon: Bool = true {
        didSet {
            self.setImage(self.showIcon ? self.arrowIcon : UIImage(), for: UIControl.State.normal)
        }
    }
    
    public var contentAlignment: ContentAlignment = .Left {
        didSet {
            contentHorizontalAlignment = (contentAlignment == .Left ? ContentHorizontalAlignment.left : ContentHorizontalAlignment.center)
        }
    }

    public convenience init(
        titleText: String,
        textAlignment: ContentAlignment = ContentAlignment.Left,

        buttonBackgroundColor: UIColor = ColorManager.mainPurple,
        buttonSecondBackgroundColor: UIColor = ColorManager.auxPurple,
        buttonTintColor: UIColor = ColorManager.colorWhite,
        buttonCornerRadius: CGFloat = 25,
        
        buttonShadowOffset: CGSize = CGSize(width: 0, height: 3),
        buttonShadowOpacity: Float = 1,
        buttonShadowRadius: CGFloat = 8,
        
        buttonDisabledBackgroundColor: UIColor = ColorManager.dissableButton,
        buttonDisabledTintColor: UIColor = ColorManager.colorWhite,
        buttonDisabledShadowColor: UIColor = UIColor.clear,
                              
        showIcon: Bool = true,
        icon: UIImage = UIImage(named: "id_card")!
    ) {
        self.init(type: UIButton.ButtonType.system)
        
        
        setTitle(titleText, for: UIControl.State.normal)
        defaultSecondBackgroundColor = buttonSecondBackgroundColor
        defaultBackgroundColor = buttonBackgroundColor
        defaultTintColor = buttonTintColor
        defaultDisabledBackgroundColor = buttonDisabledBackgroundColor
        defaultDisabledTintColor = buttonDisabledTintColor
        defaultDisabledShadowColor = buttonDisabledShadowColor
        
        self.arrowIcon = icon

        tintColor = defaultTintColor
        
        startColor = defaultSecondBackgroundColor!
        endColor = defaultBackgroundColor!
        startPoint = CGPoint(x: 0.0, y: 0.5)
        endPoint = CGPoint(x: 1.0, y: 0.5)
        
        layer.shadowOffset = buttonShadowOffset
        layer.shadowRadius = buttonShadowRadius
        layer.shadowOpacity = buttonShadowOpacity
        
        layer.cornerRadius = buttonCornerRadius
        
        switch textAlignment {
        case ContentAlignment.Left:
            contentHorizontalAlignment = ContentHorizontalAlignment.left
            if showIcon {
                setImage(icon, for: UIControl.State.normal)
                titleEdgeInsets = UIEdgeInsets(top: 0, left:  10, bottom: 0, right: 0)
                imageView?.translatesAutoresizingMaskIntoConstraints = false

                NSLayoutConstraint.activate([
                    imageView!.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
                    imageView!.centerYAnchor.constraint(equalTo: centerYAnchor),
                ])
            }else{
                titleEdgeInsets = UIEdgeInsets(top: 0, left:  10, bottom: 0, right: 0)
            }
        case ContentAlignment.Center:
            contentHorizontalAlignment = ContentHorizontalAlignment.center
            
            if showIcon {
                setImage(icon, for: UIControl.State.normal)
                semanticContentAttribute = .forceRightToLeft
                contentHorizontalAlignment = .center
                titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 25)
            }else{
                titleEdgeInsets = UIEdgeInsets(top: 0, left:  10, bottom: 0, right: 10)
            }
        }
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
   
    
    public func setEnableButton(enable: Bool){
        if enable {
            startColor = defaultSecondBackgroundColor!
            endColor = defaultBackgroundColor!
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
            tintColor = self.defaultTintColor
            setTitleColor(defaultTintColor, for: .normal)
        }else{
            startColor = defaultDisabledBackgroundColor!
            endColor = defaultDisabledBackgroundColor!
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
            tintColor = self.defaultDisabledTintColor
            setTitleColor(defaultDisabledTintColor, for: .normal)
        }
        self.isUserInteractionEnabled = enable
    }

}
