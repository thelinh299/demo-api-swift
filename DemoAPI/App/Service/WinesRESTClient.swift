//
//  WinesRESTClient.swift
//  DemoAPI
//
//  Created by Linh NGUYEN on 11/15/19.
//  Copyright © 2019 Linh NGUYEN. All rights reserved.
//

import UIKit

extension URL {
    init(baseUrl: String, path: String, queryParams: [String: String]?) {
        var components = URLComponents(string: baseUrl)!
        components.path += path
        if let params = queryParams {
            components.queryItems = params.map {
                URLQueryItem(name: $0.key, value: String(describing: $0.value))
            }
        }
        self = components.url!
    }
}

extension URLRequest {
    init(baseUrl: String, path: String, method: String, queryParams: [String: String]?, httpBody: Any?) {
        let url = URL(baseUrl: baseUrl, path: path, queryParams: queryParams)
        self.init(url: url)
        self.httpMethod = method
        setValue("application/json", forHTTPHeaderField: "Accept")
        setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let body = httpBody {
            self.httpBody = try! JSONSerialization.data(withJSONObject: body, options: [])
        }
    }
}

final class WinesRESTClient {
    private var baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func load(path: String, method: String, queryParams: [String: String], httpBody: Any?, completion: @escaping (Data?, Error?) -> ()) -> URLSessionDataTask? {

        let request = URLRequest(baseUrl: baseUrl, path: path, method: method,
                                 queryParams: queryParams, httpBody: httpBody)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
                completion(data, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
        return task
    }
}
