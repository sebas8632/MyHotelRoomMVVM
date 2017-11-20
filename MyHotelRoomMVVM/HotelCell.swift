//
//  HotelCell.swift
//  MyHotelRoomMVVM
//
//  Created by sebastian on 18/11/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class HotelCell: UITableViewCell {

    @IBOutlet var hotelIMage: UIImageView!
    
    @IBOutlet var hotelName: UILabel!
    
    @IBOutlet var hotelKind: UILabel!
    
    @IBOutlet var hotelPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        //AutoLayout programmatically.
        self.hotelIMage.contentMode = .scaleAspectFill
        self.hotelIMage.clipsToBounds = true
        
        let leadingConstraint = NSLayoutConstraint(item: self.hotelIMage, attribute: .leading, relatedBy: .equal, toItem: self.hotelIMage.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: self.hotelIMage, attribute: .trailing, relatedBy: .equal, toItem: self.hotelIMage.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: self.hotelIMage, attribute: .top, relatedBy: .equal, toItem: self.hotelIMage.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: self.hotelIMage, attribute: .bottom, relatedBy: .equal, toItem: self.hotelIMage.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
