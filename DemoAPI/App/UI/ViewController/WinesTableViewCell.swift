//
//  WinesTableViewCell.swift
//  DemoAPI
//
//  Created by Linh NGUYEN on 11/15/19.
//  Copyright © 2019 Linh NGUYEN. All rights reserved.
//

import UIKit

class WinesTableViewCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var ivThumbnail: UIImageView!
    
    var wine: Wine? {
        didSet {
            self.lbName.text = wine?.name
            switch wine?.snoothrank {
            case .double(let value):
                print(value)
            case .string(let value):
                print(value)
            case .none:
                print("Missing type")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
