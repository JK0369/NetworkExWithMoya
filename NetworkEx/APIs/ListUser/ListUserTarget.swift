//
//  ListUserTarget.swift
//  NetworkEx
//
//  Created by 김종권 on 2021/08/16.
//

import Moya

enum ListUserTarget {
    case list(ListUserRequest)
}

extension ListUserTarget: BaseTargetType, AccessTokenAuthorizable {
    var path: String {
        switch self {
        case .list: return "/api/users"
        }
    }

    var method: Method {
        switch self {
        case .list: return .get
        }
    }

    var task: Task {
        switch self {
        case .list(let request): return .requestParameters(parameters: request.toDictionary(), encoding: URLEncoding.queryString)
        }
    }

    var authorizationType: AuthorizationType? {
        return .bearer
    }
}
