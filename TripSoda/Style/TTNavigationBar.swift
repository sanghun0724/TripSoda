//
//  TTNavigationBar.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/27.
//

import UIKit

class TTNavigationBar: UIViewController{

    
    
    func blur() {
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor.systemGray2.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.9
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 3)
        navigationController?.navigationBar.layer.shadowRadius = 3

    }
    
     func attributeTitleView() -> UIView {
      let label: UILabel = UILabel()
      let lightText: NSMutableAttributedString =
        NSMutableAttributedString(string: "Title", attributes: [
        .foregroundColor: UIColor.systemIndigo,
        .font: UIFont.systemFont(ofSize: 18, weight: .light)
        ])
      let boldText: NSMutableAttributedString =
        NSMutableAttributedString(string: "Font", attributes: [
        .foregroundColor: UIColor.systemBlue,
        .font: UIFont.systemFont(ofSize: 20, weight: .medium)
        ])
      
      let naviTitle: NSMutableAttributedString
        = lightText
      naviTitle.append(boldText)
      label.attributedText = naviTitle
      
      return label
    }
}

