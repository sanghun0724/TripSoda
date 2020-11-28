//
//  ProfileViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/14.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var shadowView:UIView!
    @IBOutlet var mainProfileView:UIImageView!
    
    
    let number = "010-567-1914"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.shadowView.layer.shadowOpacity = 0.5
        self.shadowView.layer.shadowRadius = 5
        mainProfileView.clipsToBounds = true
        mainProfileView.layer.cornerRadius = mainProfileView.frame.size.width/2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func phonCall() {
        guard let number = URL(string: "tel://" + self.number) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func semdMessage() {
        guard  let chat = storyboard?.instantiateViewController(withIdentifier: "chat") else {
            return
        }
        chat.modalPresentationStyle = .fullScreen
        self.present(chat, animated: true, completion: nil)
    }

    @IBAction func backButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
