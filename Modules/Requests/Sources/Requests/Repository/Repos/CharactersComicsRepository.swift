//
//  File.swift
//  
//
//  Created by Diego Costa on 21/12/22.
//

import Foundation
import Combine
import Models

public struct CharactersComicsRepository: CharactersComicsRepositoryProtocol {
    var urlSession = URLSession.shared
    var result: ComicData
    
    public init() {
        result = .init()
    }
    
    public func getComics(characterID: Int) -> AnyPublisher<ComicData, Error> {
        urlSession.publisher(
            for: .load(characterID),
            using: result)
    }
}

extension Endpoint where Kind == EndpointKinds.Comics,
                         Response == ComicData {
    static func load(_ ID: Int) -> Self {
        Endpoint(path: "v1/public/characters/\(ID)/comics")
    }
}
