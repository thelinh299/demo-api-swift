//
//  WinesService.swift
//  DemoAPI
//
//  Created by Linh NGUYEN on 11/15/19.
//  Copyright © 2019 Linh NGUYEN. All rights reserved.
//

import UIKit

final class WinesService: BaseService {
    func getWines(keyword: String, f: UInt, n: UInt, completion: @escaping (WinesResponse?, Error?) -> ())
        -> URLSessionDataTask? {
            let queryParams = [
                "akey": "jp262sm0yq2a4eafiz26crz0j9tvdvafydzdvwzi6f3lngdq",
                "ip": "66.28.234.115",
                "q": keyword,
                "n": String(n),
                "f": String(f)
            ]
            return self.client.load(path: "/wines/", method: "GET", queryParams: queryParams, httpBody: nil) { (data, error) in
                if let data = data, error == nil {
                    let decoder = JSONDecoder()
                    let response = try! decoder.decode(WinesResponse?.self, from: data)
                    completion(response, nil)
                } else {
                    completion(nil, error)
                }
            }
    }
}
