//
//  DeviceTableViewCell.swift
//  LanScan
//
//  Created by Aritro Paul on 22/09/19.
//  Copyright © 2019 Aritro Paul. All rights reserved.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var deviceTypeLabel: UILabel!
    @IBOutlet weak var serviceButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deviceImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.makeCard()
        backView.layer.cornerRadius = 12
        serviceButton.layer.cornerRadius = 8
        editButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
