//
//  ImageViewCell.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import UIKit
import Models
import Kingfisher

final class ImageViewCell: CollectionViewCell {
    
    private var imageView: UIImageView = .init()
    private var thumbnail: ThumbImage?
    
    override func addViewHierarchy() {
        contentView.addSubview(imageView)
    }
    
    override func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    override func configureViews() {
        configureImageView()
    }

    private func configureImageView() {
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = Assets.imgNotFound.image
    }
    
    func set(thumbnail: ThumbImage?) {
        self.thumbnail = thumbnail
        if thumbnail?.isAvaliable == true, let url = thumbnail?.imageUrl {
            imageView.kf.setImage(with: url, placeholder: imageView.image)
        }
    }
}

