//
//  WinesResponse.swift
//  DemoAPI
//
//  Created by Linh NGUYEN on 11/15/19.
//  Copyright © 2019 Linh NGUYEN. All rights reserved.
//

import UIKit

struct Wine: Decodable {
    var name: String?
    var code: String?
    var region: String?
    var winery: String?
    var winery_id: String?
    var varietal: String?
    var price: String?
    var vintage: String?
    var type: String?
    var link: String?
    var tags: String?
    var image: String?
    var available: Int?
    var num_merchants: Int?
    var num_reviews: Int?
    var imageData: Data?
    var averageRating: Double?
}

struct Meta: Decodable {
    var results: Int?
    var returned: Int?
    var errmsg: String?
    var status: Int?
}

struct WinesResponse: Decodable {
    var meta: Meta?
    var wines: [Wine]?
}
