//
//  ViewController.swift
//  LanScan
//
//  Created by Aritro Paul on 21/09/19.
//  Copyright © 2019 Aritro Paul. All rights reserved.
//

import UIKit
import MMLanScan

class ViewController: UIViewController {

    var lanScanner : MMLANScanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lanScanner = MMLANScanner(delegate:self)
        self.lanScanner.start()
        // Do any additional setup after loading the view.
    }

    

}
extension ViewController: MMLANScannerDelegate {
    func lanScanDidFindNewDevice(_ device: MMDevice!) {
        print(device.ipAddress)
        print(device.macAddressLabel())
        
    }
    
    func lanScanDidFinishScanning(with status: MMLanScannerStatus) {
        //
    }
    
    func lanScanDidFailedToScan() {
        //
    }
    
        
}

