//
//  Story+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension Story {
    static func fixture(
        id: Int = 0,
        title: String = "",
        resourceURI: String = ""
    ) -> Story {
        .init(id: id,
              title: title,
              resourceURI: resourceURI)
    }
}
