//
//  ComicData+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension ComicData {
    static func fixture(
        data: ComicResult = .fixture()
    ) -> ComicData {
        .init(data: data)
    }
}
