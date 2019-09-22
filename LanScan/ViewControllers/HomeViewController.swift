//
//  HomeViewController.swift
//  LanScan
//
//  Created by Aritro Paul on 22/09/19.
//  Copyright © 2019 Aritro Paul. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var deviceTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceTableView.delegate = self
        deviceTableView.dataSource = self
        deviceTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        // Do any additional setup after loading the view.
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell") as! DeviceTableViewCell
        cell.deviceNameLabel.text = "Aritro's Macbook Air"
        cell.deviceTypeLabel.text = "Laptop".uppercased()
        return cell
    }
    
    
}
