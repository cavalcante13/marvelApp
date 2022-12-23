//
//  CharactersRepositorySpy.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 21/12/22.
//

import Foundation
import Combine
import Models
import Requests

@testable import MarvelApp

final class CharactersRepositoryProtocolSpy: CharactersRepositoryProtocol {
    enum Method: Equatable {
        case getCharacters(Int)
    }
    private let characterData: CharacterData = .fixture()
    private(set) var calledMethods: [Method] = []
    
    lazy var response: Response = .success(characterData)
    
    func getCharacters(offset: Int) -> AnyPublisher<Models.CharacterData, Error> {
        calledMethods.append(.getCharacters(offset))
        return response.publisher
    }
}
