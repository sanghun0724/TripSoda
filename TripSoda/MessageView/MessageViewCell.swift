//
//  MessageViewCell.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/12.
//

import UIKit

class MessageViewCell: UITableViewCell {

    @IBOutlet var profileVIew:UIView!
    @IBOutlet var profileLabel:UILabel!
    @IBOutlet var messageLabel:UILabel!

    override func draw(_ rect: CGRect) { //Your code should go here.
        super.draw(rect)
        profileVIew.clipsToBounds = true
           profileVIew.layer.cornerRadius = profileVIew.frame.size.width/2
        }
}
