//
//  WinesService.swift
//  DemoAPI
//
//  Created by Linh NGUYEN on 11/15/19.
//  Copyright © 2019 Linh NGUYEN. All rights reserved.
//

import UIKit

final class WinesService: BaseService {
    func getWines(keyword: String, completion: @escaping ([Wine]?, Error?) -> ())
        -> URLSessionDataTask? {
            let queryParams = [
                "key": "{{key}}",
                "ip": "192.168.1.1",
                "q": keyword,
            ]
            return self.client.load(path: "/wines", method: "GET", queryParams: queryParams, httpBody: nil) { (data, error) in
                if let data = data, error == nil {
                    let decoder = JSONDecoder()
                    let response = try! decoder.decode(WinesResponse?.self, from: data)
                    completion(response?.wines, nil)
                } else {
                    completion(nil, error)
                }
            }
    }
}
