//
//  TabbarController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/09.
//

import UIKit
import Foundation
import VBRRollingPit

class TabbarController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBar.barTintColor = UIColor(red: 49/255, green: 75/255, blue:188/255 , alpha: 1.0)
        
        let selectedColor = UIColor.white
        let unselectedColor = UIColor.algae
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        self.tabBar.unselectedItemTintColor = UIColor.algae
        
        
    }
    

}
