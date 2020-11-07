//
//  audioMain.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import UIKit
import AVFoundation

class audioMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
