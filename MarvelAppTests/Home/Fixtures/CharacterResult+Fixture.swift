//
//  CharacterResult+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension CharacterResult {
    static func fixture(
        results: [Character] = [.fixture()]
    ) -> CharacterResult {
        .init(results: results)
    }
}
