//
//  CompositionalLayoutSection.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import Foundation

enum CompositionalLayoutSection: Int, Hashable {
    case releases
    case populars
    case comics
    case stories
    
    var title: String {
        switch self {
        case .releases:
            return "Lançamentos"
        case .populars:
            return "Populares"
        case .comics:
            return "Quadrinhos"
        case .stories:
            return "Histórias"
        }
    }

    enum SupplementaryElementKind {
        static let sectionHeader = "supplementary.section.header"
    }
}
