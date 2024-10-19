//
//  Utility.swift
//  Notes
//
//  Created by Kushang  on 06/10/24.
//

import Foundation
import UIKit
import Toast_Swift

class Utility: NSObject{
    
    static func setGradientBackground(view: UIView, colorTop: UIColor, colorBottom: UIColor) {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
                
        view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    class func successAlert(message: String, view: UIView){
        var style = ToastStyle()
        style.backgroundColor = UIColor.green
        style.messageColor = .black
        ToastManager.shared.isTapToDismissEnabled = true
        view.makeToast(message, duration: 3.0, position: .top, style: style)
    }
    
    class func errorAlert(message: String, view: UIView){
        var style = ToastStyle()
        style.backgroundColor = UIColor.red
        style.messageColor = .white
        ToastManager.shared.isTapToDismissEnabled = true
        view.makeToast(message, duration: 3.0, position: .top, style: style)
    }
}
