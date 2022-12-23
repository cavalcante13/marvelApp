//
//  CharacterRepository.swift
//  MarvelApi
//
//  Created by Diego Costa on 16/11/22.
//

import Foundation
import Models
import Combine

public protocol CharactersRepositoryProtocol {
    func getCharacters(offset: Int) -> AnyPublisher<CharacterData, Error>
}
