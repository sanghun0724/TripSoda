//
//  PopupViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/12.
//

import UIKit

class PopupViewController: UIViewController {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var subtitleLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true 
       
    }
    @IBAction func cancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func audioButton() {
                guard let next = self.storyboard?.instantiateViewController(withIdentifier: "audio") else {
                   return
               }
//        performSegue(withIdentifier: "secondAudio", sender: self)
//        self.navigationController!.pushViewController(next, animated: true)
    }
}
