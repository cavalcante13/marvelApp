//
//  Comics+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension Comics {
    static func fixture(
        thumbnail: ThumbImage = .fixture()
    ) -> Comics {
        .init(thumbnail: thumbnail)
    }
}
