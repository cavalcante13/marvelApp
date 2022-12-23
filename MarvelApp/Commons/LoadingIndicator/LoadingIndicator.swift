//
//  LoadingIndicator.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//
import UIKit
import KRProgressHUD

protocol LoadingIndicator {
    func stop()
    func show()
    func show(message: String)
    func showError(message: String)
}

struct LoadingProgressHUD: LoadingIndicator {
   
    func show() {
        KRProgressHUD
            .set(style: .custom(background: .black, text: .white, icon: nil))
            .set(maskType: .black)
            .show()
    }
    
    func show(message: String) {
        KRProgressHUD
            .set(style: .custom(background: .black, text: .white, icon: nil))
            .set(maskType: .black)
            .show(withMessage: message)
    }

    func showError(message: String) {
        KRProgressHUD
            .set(style: .custom(background: .black, text: .white, icon: nil))
            .set(maskType: .black)
            .showError(withMessage: message)
    }
    
    func stop() {
        KRProgressHUD.dismiss()
    }
}
