//
//  ViewController.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import UIKit

class ViewController: UIViewController, ViewConfigurator {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func prepareViews() {}
    func addViewHierarchy() {}
    func setupConstraints() {}
    func configureViews() {}
    func bindingViews() {}
}
