//
//  View.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import Foundation
import UIKit

class View: UIView, ViewConfigurator {

    public init() {
        super.init(frame: .zero)
        setup()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func prepareViews() {}
    func addViewHierarchy() {}
    func setupConstraints() {}
    func configureViews() {}
    func bindingViews() {}
}
