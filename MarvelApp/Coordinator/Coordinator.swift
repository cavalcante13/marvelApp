//
//  Coordinator.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import UIKit
import Models

protocol Coordinator {
    var nav: UINavigationController { get }
    
    func start()
}
