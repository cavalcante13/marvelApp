//
//  Character.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import Foundation

public struct CharacterData: Codable {
    public init() {}
    public var data: CharacterResult = .init()
    public init(data: CharacterResult) {
        self.data = data
    }
}

public struct CharacterResult: Codable {
    public init() {}
    public var results: [Character] = []
    public init(results: [Character]) {
        self.results = results
    }
}

public struct Character: Codable, Hashable, Equatable {
    public var uuid: UUID = .init()
    public var id: Int = 0
    public var name: String?
    public var bio: String?
    public var description: String?
    public var thumbnail: ThumbImage?
    
    public enum CodingKeys: String, CodingKey {
        case id, name, bio, description, thumbnail
    }
    
    public init() {}
    
    public init(uuid: UUID = .init(), id: Int, name: String?, bio: String?, description: String?, thumbnail: ThumbImage?) {
        self.uuid = uuid
        self.id = id
        self.name = name
        self.bio = bio
        self.description = description
        self.thumbnail = thumbnail
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
}


