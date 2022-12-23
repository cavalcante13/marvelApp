//
//  ButtonViewCell.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import UIKit

class ButtonViewCell: CollectionViewCell {
    
    typealias ActionButton = ()-> Swift.Void
    private(set) var button: UIButton = .init(type: .custom)
    
    var action: ActionButton?
    
    override func addViewHierarchy() {
        contentView.addSubview(button)
    }
    
    override func setupConstraints() {
        button.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    override func configureViews() {
        configureButton()
    }

    private func configureButton() {
        button.setTitleColor(.systemBlue, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(retryButtonAction(_:)), for: .touchUpInside)
    }
    
    @objc
    private func retryButtonAction(_ sender: UIButton) {
        action?()
    }
    
    func set(title: String?, action: ActionButton?) {
        self.action = action
        self.button.setTitle(title, for: .normal)
    }
}
