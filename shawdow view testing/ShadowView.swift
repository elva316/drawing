//
//  ShadowView.swift
//  shawdow view testing
//
//  Created by elva wang on 11/27/17.
//  Copyright © 2017 elva wang. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width:0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowPath = CGPath(rect: bounds, transform: nil)
        layer.masksToBounds = false
    }


}
