//
//  File.swift
//  
//
//  Created by Diego Costa on 21/12/22.
//

import Foundation
import Models
import Combine

public protocol CharactersComicsRepositoryProtocol {
    func getComics(characterID: Int) -> AnyPublisher<ComicData, Error>
}
