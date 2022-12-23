//
//  CharacterData+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension CharacterData {
    static func fixture(
        data: CharacterResult = .fixture()
    ) -> CharacterData {
        .init(data: data)
    }
}
