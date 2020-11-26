//
//  ProfileViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/14.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let number = "010-567-1914"
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
