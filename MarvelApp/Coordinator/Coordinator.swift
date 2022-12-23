//
//  Coordinator.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import UIKit
import Models

enum Screens {
    case home
    case detail(Character)
}

protocol Coordinator {
    var nav: UINavigationController { get }
    
    func start()
    
    func push(_ screen: Screens)
}
