//
//  WinesViewController.swift
//  DemoAPI
//
//  Created by Linh NGUYEN on 11/15/19.
//  Copyright © 2019 Linh NGUYEN. All rights reserved.
//

import UIKit

class WinesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "WinesTableViewCell"
    
    var wines: [Wine] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    fileprivate func setupUI() {
        tableView.register(UINib.init(nibName: "WinesTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}

extension WinesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                    for: indexPath) as? WinesTableViewCell {
            cell.wine = wines[indexPath.row]
        }
        return WinesTableViewCell()
    }
}
