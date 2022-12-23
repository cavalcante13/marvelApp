//
//  Character+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension Character {
    static func fixture(
        uuid: UUID = .init(),
        id: Int = 0,
        name: String = "",
        bio: String = "",
        description: String = "",
        thumbnail: ThumbImage = .fixture()
    ) -> Character {
        .init(id: id,
              name: name,
              bio: bio,
              description: description,
              thumbnail: thumbnail)
    }
}
