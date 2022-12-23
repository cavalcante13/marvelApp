//
//  ThumbImage+Fixture.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
@testable import MarvelApp

extension ThumbImage {
    static func fixture(
        uuid: UUID = .init(),
        path: String = "",
        imageExtension: String = ""
    ) -> ThumbImage {
        .init(path: path,
              imageExtension: imageExtension)
    }
}
