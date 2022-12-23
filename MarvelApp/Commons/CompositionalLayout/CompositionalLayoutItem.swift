//
//  CompositionalLayoutItem.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import Foundation
import Models
import Requests

enum CompositionalLayoutItem: Hashable {
    case characters(Character)
    case comics(Comics)
    case stories(Story)
}
