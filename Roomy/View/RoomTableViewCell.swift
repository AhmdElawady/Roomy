//
//  RoomTableViewCell.swift
//  Roomy
//
//  Created by Awady on 7/31/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var ContentCell: UIView!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bedLabel: UILabel!
    @IBOutlet weak var bathLabel: UILabel!
    @IBOutlet weak var roomPicturLabel1: UIImageView!
    @IBOutlet weak var roomPicturLabel2: UIImageView!
    @IBOutlet weak var roomPicturLabel3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func roomCell(roomData: RoomContent) {
        
        addressLabel.text = roomData.address
        cityLabel.text = roomData.city
        priceLabel.text = roomData.price
        bedLabel.text = String(roomData.bed) + " Bed"
        bathLabel.text = String(roomData.bath) + " Bath"
        roomPicturLabel1.image = roomData.pic1
        roomPicturLabel2.image = roomData.pic2
        roomPicturLabel3.image = roomData.pic3
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
