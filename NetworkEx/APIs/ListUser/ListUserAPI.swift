//
//  MyAPI.swift
//  NetworkEx
//
//  Created by 김종권 on 2021/08/16.
//

import Foundation
import Moya

struct ListUserAPI: Networkable {
    typealias Target = ListUserTarget

    /// page에 해당하는 User 정보 조회
    static func getUserList(request: ListUserRequest, completion: @escaping (_ succeed: ListUser?, _ failed: Error?) -> Void) {
        makeProvider().request(.list(request)) { result in
            switch ResponseData<ListUser>.processJSONResponse(result) {
            case .success(let model): return completion(model, nil)
            case .failure(let error): return completion(nil, error)
            }
        }
    }
}
