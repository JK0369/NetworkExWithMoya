//
//  Networkable.swift
//  NetworkEx
//
//  Created by 김종권 on 2021/08/16.
//

import Moya

protocol Networkable {
    associatedtype Target: TargetType
    static func makeProvider() -> MoyaProvider<Target>
}

extension Networkable {
    static func makeProvider() -> MoyaProvider<Target> {
        /// Set access token plugin
        let authPlugin = AccessTokenPlugin { _ in
            return "SUPER-ACCESS-TOKEN-FOR-TAP-RIDER"
        }

        /// Set network logger plugin
        let loggerPlugin = NetworkLoggerPlugin()

        return MoyaProvider<Target>(plugins: [authPlugin, loggerPlugin])
    }
}
