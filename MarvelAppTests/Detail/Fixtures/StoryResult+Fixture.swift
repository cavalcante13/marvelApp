//
//  StoryResult+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension StoryResult {
    static func fixture(
        results: [Story] = [.fixture()]
    ) -> StoryResult {
        .init(results: results)
    }
}
