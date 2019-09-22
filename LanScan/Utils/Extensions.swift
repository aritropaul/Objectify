//
//  Extensions.swift
//  LanScan
//
//  Created by Aritro Paul on 22/09/19.
//  Copyright © 2019 Aritro Paul. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func makeCard(){
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.2
        self.layer.shadowColor = UIColor.black.cgColor
    }
}
