//
//  ProfileViewCell.swift
//  SquashSampleApps
//
//  Created by Jack on 28/10/20.
//  Copyright © 2020 SquashApps. All rights reserved.
//

import UIKit

class ProfileViewCell: UICollectionViewCell {

    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var tickImageView: UIImageView!
    @IBOutlet weak var followBtnRef: UIButton!
    @IBOutlet weak var messageSendView: UIView!
    @IBOutlet weak var tickView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
