//
//  TourDetailController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import UIKit

class TourDetailController: UIViewController {

    let number = "010-5670-1914"
    
    @IBOutlet weak var decoView:UIView!
    @IBOutlet weak var decoButton:UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
        
    }
    
    func designUI() {
        self.decoView.layer.cornerRadius = 40
        decoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBarItem.title = nil
        self.decoButton.layer.cornerRadius = 20
    }
    
    @IBAction func audioButton(_ sender:Any) {
//        guard let next = self.storyboard?.instantiateViewController(withIdentifier: "audio") else {
//            return
//        }
//        self.navigationController?.pushViewController(next, animated: true)
//
        
   }
    
    @IBAction func PhoneButtonAction(_ sender:Any) {
        guard let number = URL(string: "tel://" + self.number) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func MovingToMap(_sender:Any) {
        guard let map = 
    }
    
    @IBAction func MovingToAudio(_sender:Any) {
        
    }

}
