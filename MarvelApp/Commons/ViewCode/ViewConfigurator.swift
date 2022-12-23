//
//  ViewConfigurator.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import UIKit

protocol ViewConfigurator: AnyObject {
    func setup()
    func prepareViews()
    func addViewHierarchy()
    func setupConstraints()
    func configureViews()
    func bindingViews()
}

extension ViewConfigurator {
    func setup() {
        prepareViews()
        addViewHierarchy()
        setupConstraints()
        configureViews()
        bindingViews()
    }
}
