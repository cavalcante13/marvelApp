//
//  CollectionViewCell.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, ViewConfigurator {

    init() {
        super.init(frame: .zero)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func prepareViews() {}
    func addViewHierarchy() {}
    func setupConstraints() {}
    func configureViews() {}
    func bindingViews() {}
}
