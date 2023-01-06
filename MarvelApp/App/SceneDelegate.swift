//
//  SceneDelegate.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        
        let nav = AppNavigationController()
        let coordinator = MainCoordinator(nav)
        coordinator.start()
        
        window = .init(windowScene: scene)
        window?.backgroundColor = .white
        window?.rootViewController = coordinator.nav
        window?.makeKeyAndVisible()
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
    }
}
