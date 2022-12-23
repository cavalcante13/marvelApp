//
//  ErrorView.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import Foundation
import UIKit

typealias ActionButton = ()-> Swift.Void

protocol GenericErrorViewProtocol {
    func show(inView: UIView, message: String, action: ActionButton?)
}

final class ErrorView: View, GenericErrorViewProtocol {
    
    private var stackView: UIStackView = .init()
    private var messageLabel: UILabel = .init()
    private var retryButton: UIButton = .init(type: .custom)
    var action: ActionButton?
    
    private var message: String {
        didSet { self.messageLabel.text = message }
    }
    
    convenience override init() {
        self.init(message: "")
    }
    
    init(message: String) {
        self.message = message
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        nil
    }
    
    override func addViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(retryButton)
    }
    
    override func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    override func configureViews() {
        configureStackView()
        configureMessageLabel()
        configureRetryButton()
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
    }
    
    private func configureMessageLabel() {
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.textColor = .white
        messageLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    private func configureRetryButton() {
        retryButton.setTitle("Tentar novamente", for: .normal)
        retryButton.setTitleColor(.systemBlue, for: .normal)
        retryButton.addTarget(self, action: #selector(retryButtonAction(_:)), for: .touchUpInside)
    }
    
    @objc
    private func retryButtonAction(_ sender: UIButton) {
        if let action = action {
            removeFromSuperview()
            action()
        }
    }
    
    func show(inView: UIView, message: String, action: ActionButton?) {
        self.message = message
        self.action = action
        
        if inView.subviews.contains(self) {
            removeFromSuperview()
        }
        inView.addSubview(self)
        
        self.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
