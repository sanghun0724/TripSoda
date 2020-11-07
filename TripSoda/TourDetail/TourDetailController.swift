//
//  TourDetailController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import UIKit

class TourDetailController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    
    @IBAction func audioButton(_ sender:Any) {
        guard let next = self.storyboard?.instantiateViewController(withIdentifier: "audio") else {
            return
        }
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
    }

   

}
