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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
