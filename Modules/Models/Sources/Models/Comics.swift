//
//  Comics.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import Foundation

public struct ComicData: Codable {
    public init() {}
    public var data: ComicResult = .init()
    public init(data: ComicResult) {
        self.data = data
    }
}

public struct ComicResult: Codable {
    public init() {}
    public var results: [Comics] = []
    public init(results: [Comics]) {
        self.results = results
    }
}

public struct Comics: Codable, Hashable {
    public var thumbnail: ThumbImage?
    public init() {}
    public init(thumbnail: ThumbImage) {
        self.thumbnail = thumbnail
    }
}
