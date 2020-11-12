//
//  TEST.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/12.
//

import UIKit

class TEST: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }

    @IBAction func RR() {
        guard let next = self.storyboard?.instantiateViewController(identifier: "chat") else {
            return
        }
        let nav = UINavigationController(rootViewController:self)
        (UIApplication.shared.delegate as! AppDelegate).window!.rootViewController = nav
        self.navigationController!.pushViewController(next, animated: true)
        // Do any additional setup after loading the view.
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
