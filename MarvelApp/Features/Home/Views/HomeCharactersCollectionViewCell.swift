//
//  HomeCharactersCollectionViewCell.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import UIKit
import Kingfisher
import Models

final class HomeCharactersCollectionViewCell: CollectionViewCell {
    
    private var stackView: UIStackView = .init()
    private var imageView: UIImageView = .init()
    private var nameLabel: UILabel = .init()
    private var character: Character?
    
    override func addViewHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
    }
    
    override func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.8).priority(.low)
        }
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    override func configureViews() {
        configureStackView()
        configureImageView()
        configureNameLabel()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = Assets.imgNotFound.image
    }
    
    func set(character: Character) {
        self.character = character
        self.nameLabel.text = character.name
        
        if character.thumbnail?.isAvaliable == true, let url = character.thumbnail?.imageUrl {
            imageView.kf.setImage(with: url, placeholder: Assets.imgNotFound.image)
        }
    }
    
    func setAccessibility(label: String, value: String) {
        isAccessibilityElement = true
        accessibilityTraits = .button
        accessibilityLabel = label
        accessibilityValue = value
    }

    private func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2
    }
    
    private func configureImageView() {
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.accessibilityElementsHidden = true
        imageView.image = Assets.imgNotFound.image
    }
    
    private func configureNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .left
        nameLabel.textColor = .white
        nameLabel.font = .preferredFont(forTextStyle: .title3)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.isAccessibilityElement = false
    }
}
