//
//  File.swift
//  
//
//  Created by Diego Costa on 21/12/22.
//

import Foundation
import Combine
import Models

public struct CharactersStoriesRepository: CharactersStoriesRepositoryProtocol {
    var urlSession = URLSession.shared
    var result: StoryData
    
    public init() {
        result = .init()
    }
    
    public func getStories(characterID: Int) -> AnyPublisher<Models.StoryData, Error> {
        urlSession.publisher(
            for: .load(characterID),
            using: result)
    }
}

extension Endpoint where Kind == EndpointKinds.Stories,
                         Response == StoryData {
    static func load(_ ID: Int) -> Self {
        Endpoint(path: "v1/public/characters/\(ID)/stories")
    }
}
