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
            return Strings.Layout.Sections.Releases.title
        case .populars:
            return Strings.Layout.Sections.Populars.title
        case .comics:
            return Strings.Layout.Sections.Comics.title
        case .stories:
            return Strings.Layout.Sections.Stories.title
        }
    }

    enum SupplementaryElementKind {
        static let sectionHeader = "supplementary.section.header"
    }
}
