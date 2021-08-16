//
//  NetworkError.swift
//  NetworkEx
//
//  Created by 김종권 on 2021/08/16.
//

import Foundation
import Moya

// back-end 팀과 정의한 에러 내용
enum ServiceError: Error {
    case moyaError(MoyaError)
    case invalidResponse(responseCode: Int, message: String)
    case tokenExpired
    case refreshTokenExpired
    case duplicateLoggedIn(message: String)
}

extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .moyaError(let moyaError):
            return moyaError.localizedDescription
        case let .invalidResponse(_, message):
            return message
        case .tokenExpired:
            return "AccessToken Expired"
        case .refreshTokenExpired:
            return "RefreshToken Expired"
        case let .duplicateLoggedIn(message):
            return message
        }
    }
}

