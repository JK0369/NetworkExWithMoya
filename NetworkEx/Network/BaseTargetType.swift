//
//  BaseTargetType.swift
//  NetworkEx
//
//  Created by 김종권 on 2021/08/16.
//

import Moya
import UIKit

protocol BaseTargetType: TargetType {
}

extension BaseTargetType {
    var baseURL: URL {
        // Configuration을 통해 phase별 baseURL 설정 방법: https://ios-development.tistory.com/660
//        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "API_URL") as? String else { fatalError("API URL not defined")}
//        gaurd let apiURL = URL(string: urlString) else { fatalError("URL is invalid") }

        return URL(string: "https://reqres.in")!
    }

    var headers: [String: String]? {
        var header = ["Content-Type": "application/json"]
        let bundleVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        header["app-device-uuid"] = "uuid"
        header["app-device-model-name"] = UIDevice.current.name
        header["app-device-os-version"] = UIDevice.current.systemVersion
        header["app-device-device-manufacturer"] = "apple"
        header["app-version"] = bundleVersion
        header["app-timezone-id"] = TimeZone.current.identifier
        return header
    }

    var sampleData: Data {
        return Data()
    }

}
