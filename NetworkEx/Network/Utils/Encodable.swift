//
//  Encodable.swift
//  NetworkEx
//
//  Created by 김종권 on 2021/08/16.
//

import Foundation

extension Encodable {
    func toDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let dic = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            return dic ?? [:]
        } catch {
            return [:]
        }
    }
}
