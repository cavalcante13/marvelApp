//
//  CompositionalLayoutHeaderView.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import UIKit

final class CompositionalLayoutHeaderView: UICollectionReusableView {
    
    static var reuseIdentifier: String = "CompositionalLayoutHeaderView"
    private var label: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareLayout()
    }

    private func prepareLayout() {
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.top.bottom.equalToSuperview()
        }
    }

    func set(title: String) {
        self.label.text = title
    }
}
