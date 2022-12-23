//
//  CharactersComicsRepositorySpy.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 21/12/22.
//

import Foundation
import Combine
import Models
import Requests

@testable import MarvelApp

final class CharactersComicsRepositorySpy: CharactersComicsRepositoryProtocol {
    enum Method: Equatable {
        case getComics(Int)
    }
    
    private let comicsData = ComicData()
    private(set) var calledMethods: [Method] = []
    lazy var response: Response = .success(comicsData)

    func getComics(characterID: Int) -> AnyPublisher<Models.ComicData, Error> {
        calledMethods.append(.getComics(characterID))
        return response.publisher
    }
}
