//
//  HomeCell.swift
//  Roomy
//
//  Created by Awady on 7/10/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit
import Foundation

class HomeCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @IBOutlet weak var streetAddressLabel: UILabel!
    
    @IBOutlet weak var postalAddressLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    @IBOutlet weak var RoomDetails: UITextView!
    
    @IBOutlet weak var ApartmentView1: UIImageView!
    
    @IBOutlet weak var ApartmentView2: UIImageView!
    
    @IBOutlet weak var ApartmentView3: UIImageView!
    
    func setHome(home: Apartment) {
        streetAddressLabel.text = home.street
        postalAddressLabel.text = home.postal
        PriceLabel.text = String(home.price)
        RoomDetails.text = home.room
        ApartmentView1.image = home.view1
        ApartmentView2.image = home.view2
        ApartmentView3.image = home.view3
        
    }
}

class Apartment {
    var street: String
    var postal: String
    var price: Int
    var room: String
    var view1: UIImage
    var view2: UIImage
    var view3: UIImage
    
    
    init(street: String, postal: String, price: Int, room: String, view1: UIImage, view2: UIImage, view3: UIImage) {

        self.street = street
        self.postal = postal
        self.price = price
        self.room = room
        self.view1 = view1
        self.view2 = view2
        self.view3 = view3
        
    }
}
