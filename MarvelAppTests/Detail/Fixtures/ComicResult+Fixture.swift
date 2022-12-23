//
//  ComicResult+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension ComicResult {
    static func fixture(
        results: [Comics] = [.fixture()]
    ) -> ComicResult {
        .init(results: results)
    }
}

