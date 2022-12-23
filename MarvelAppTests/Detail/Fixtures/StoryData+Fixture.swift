//
//  StoryData+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension StoryData {
    static func fixture(
        data: StoryResult = .fixture()
    ) -> StoryData {
        .init(data: data)
    }
}
