//
//  ImageService.swift
//  DemoAPI
//
//  Created by Linh NGUYEN on 11/18/19.
//  Copyright © 2019 Linh NGUYEN. All rights reserved.
//

import UIKit

class ImageService {
    let downloadQueue: OperationQueue!
    init() {
        self.downloadQueue = OperationQueue()
        self.downloadQueue.maxConcurrentOperationCount = 3
    }
    
    func downloadImage(url: URL, args: [String: AnyObject]?,
                       completion: ((UIImage, [String: AnyObject]?) -> Void)?) {
    }
}
