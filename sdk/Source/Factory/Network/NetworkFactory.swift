//
//  NetworkFactory.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

import Moya

class NetworkFactory {
    static func getSearchNetwork(endpointClosure: @escaping ((SearchAPI) -> Endpoint) = MoyaProvider.defaultEndpointMapping,
                                 stubClosure: @escaping ((SearchAPI) -> Moya.StubBehavior) = MoyaProvider.neverStub) -> SearchNetworkProtocol {
        let provider = MoyaProvider<SearchAPI>(endpointClosure: endpointClosure, stubClosure: stubClosure)
        let config = ITunesConfig()
        return SearchNetwork(provider: provider, config: config)
    }
}