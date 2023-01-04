//
//  AppNavigationController.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import UIKit

final class AppNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.prepareLayout()
    }

    private func prepareLayout() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().tintColor            = .white
        UINavigationBar.appearance().standardAppearance   = appearance
        UINavigationBar.appearance().compactAppearance    = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension AppNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = .init(title: " ", style: .done, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem?.accessibilityLabel = Strings.Accessibility.App.Navigation.backButton
    }
}
