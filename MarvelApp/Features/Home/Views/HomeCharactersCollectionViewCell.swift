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
        self.imageView.image = UIImage(named: "img-not-found")
    }
    
    func set(character: Character) {
        self.character = character
        self.nameLabel.text = character.name
        
        if character.thumbnail?.isAvaliable == true, let url = character.thumbnail?.imageUrl {
            imageView.kf.setImage(with: url, placeholder: imageView.image)
        }
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
        imageView.image = UIImage(named: "img-not-found")
    }
    
    private func configureNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .left
        nameLabel.textColor = .white
        nameLabel.font = .boldSystemFont(ofSize: 18)
    }
}
