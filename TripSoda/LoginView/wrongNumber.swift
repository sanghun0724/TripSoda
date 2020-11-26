//
//  wrongNumber.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/05.
//

import UIKit

class wrongNumber: UIViewController {

    @IBOutlet var wrongImage:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButton(_ sender:Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
