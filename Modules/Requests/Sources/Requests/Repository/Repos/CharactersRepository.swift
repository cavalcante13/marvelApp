//
//  File.swift
//  
//
//  Created by Diego Costa on 21/12/22.
//

import Foundation
import Combine
import Models

public struct CharactersRepository: CharactersRepositoryProtocol {
    var urlSession = URLSession.shared
    var resultData: CharacterData
    
    public init() {
        resultData = .init()
    }
    
    public func getCharacters(offset: Int) -> AnyPublisher<Models.CharacterData, Error> {
        urlSession.publisher(
            for: .load(offset: offset),
            using: resultData)
    }
}

extension Endpoint where Kind == EndpointKinds.Characters,
                         Response == CharacterData {
    static func load(offset: Int) -> Self {
        Endpoint(path: "v1/public/characters", queryItems: [
            URLQueryItem(name: "offset", value: "\(offset)")
        ])
    }
}
