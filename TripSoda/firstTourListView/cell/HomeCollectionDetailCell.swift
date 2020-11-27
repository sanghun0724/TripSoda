//
//  HomeCollectionDetailCell.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import UIKit

class HomeCollectionDetailCell:UICollectionViewCell {
    
    @IBOutlet weak var squenceImage:UIImageView!
    @IBOutlet weak var squenceLabel:UILabel!
    @IBOutlet weak var squeceTime:UILabel!
    @IBOutlet weak var stack:UIStackView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
    override func draw(_ rect: CGRect) { //Your code should go here.
        super.draw(rect)
        self.view1.layer.cornerRadius = 5
        self.view2.layer.cornerRadius = 5
        self.view3.layer.cornerRadius = 5
        self.view4.layer.cornerRadius = 5
        self.view5.layer.cornerRadius = 5
        }


}
