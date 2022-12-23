//
//  NetworkRequest.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import Foundation
import Combine
import Models

public enum RequestError: Error {
    case transportError
    case decodeParser
    case urlMalformed
    
    public var nsError: NSError {
        return .init(domain: localizedDescription,
                     code: -1,
                     userInfo: [:])
    }
}

struct Endpoint<Kind: EndpointKind, Response: Decodable> {
    var path: String
    var queryItems = [URLQueryItem]()
}

extension URLSession {
    func publisher<K, R>(
        for endpoint: Endpoint<K, R>,
        using requestData: K.RequestData,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<R, Error> {
        guard let request = endpoint.makeRequest(with: requestData) else {
            return Fail(
                error: RequestError.urlMalformed
            ).eraseToAnyPublisher()
        }

        return dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .mapError { error -> Error in
                    return RequestError.transportError
                }
            .map(\.data)
            .decode(
                type: R.self,
                decoder: JSONDecoder()
            ).eraseToAnyPublisher()
    }
}

extension Endpoint {
    func makeRequest(with data: Kind.RequestData) -> URLRequest? {
        var components = URLComponents()
        components.scheme = MarvelEnvironmentConfig.scheme
        components.host = MarvelEnvironmentConfig.host
        components.path = "/" + path
        components.queryItems = queryItems

        let queryItems: [URLQueryItem] = MarvelEnvironmentConfig.authParams.map {
            .init(name: $0.key, value: $0.value)
        }
        
        components.queryItems?.append(contentsOf: queryItems)

        guard let url = components.url else {
            return nil
        }

        var request = URLRequest(url: url)
        Kind.prepare(&request, with: data)
        return request
    }
}
