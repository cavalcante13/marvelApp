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
            return Strings.Localizable.Layout.Sections.Releases.title
        case .populars:
            return Strings.Localizable.Layout.Sections.Populars.title
        case .comics:
            return Strings.Localizable.Layout.Sections.Comics.title
        case .stories:
            return Strings.Localizable.Layout.Sections.Stories.title
        }
    }

    enum SupplementaryElementKind {
        static let sectionHeader = "supplementary.section.header"
    }
}
