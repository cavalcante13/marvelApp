//
//  File.swift
//  
//
//  Created by Diego Costa on 21/12/22.
//

import Foundation
import Models

protocol EndpointKind {
    associatedtype RequestData
    
    static func prepare(_ request: inout URLRequest,
                        with data: RequestData)
}

enum EndpointKinds {
    enum Characters: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with token: CharacterData) {}
    }
    
    enum Comics: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with data: ComicData) {}
    }
    
    enum Stories: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with data: StoryData) {}
    }
}

extension EndpointKinds {
    enum Stub: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with data: Void) {}
    }
}
