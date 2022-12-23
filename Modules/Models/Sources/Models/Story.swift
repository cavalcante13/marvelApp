//
//  Story.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import Foundation

public struct StoryData: Codable {
    public init() {}
    public var data: StoryResult = .init()
    public init(data: StoryResult) {
        self.data = data
    }
}

public struct StoryResult: Codable {
    public init() {}
    public var results: [Story] = []
    public init(results: [Story]) {
        self.results = results
    }
}

public struct Story: Codable, Hashable {
    public var id: Int?
    public var title: String?
    public var resourceURI: String?
    public init() {}
    public init(id: Int, title: String, resourceURI: String) {
        self.id = id
        self.title = title
        self.resourceURI = resourceURI
    }
}
