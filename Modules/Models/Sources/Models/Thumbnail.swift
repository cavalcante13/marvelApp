//
//  CharacterThumbImage.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import Foundation

public struct ThumbImage: Codable, Hashable {
    private let notAvailableUrl = "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available"
    public var uuid: UUID = .init()
    public var path: String?
    public var imageExtension: String?
    
    public init() {}
    public init(path: String, imageExtension: String) {
        self.path = path
        self.imageExtension = imageExtension
    }
    
    public enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
    
    public var imageUrl: URL? {
        if let path = path, let ext = imageExtension {
            return URL(string: "\(path).\(ext)")
        }
        return nil
    }
    
    public var isAvaliable: Bool {
        return path != notAvailableUrl
    }
}
