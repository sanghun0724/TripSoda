//
//  TEST.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/12.
//

import UIKit

class TEST: UINavigationController{
     
    var chatDelegate = MessageChatViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        if self.isBeingPresented == true {
            moveTochat()
        }
        else if  chatDelegate.isMovingFromParent {
            print ("@@@@@@@@@@@@@@@@@@살려줘어어어")
            self.dismiss(animated: true , completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    func moveTochat() {
        guard let next = self.storyboard?.instantiateViewController(identifier: "chat") else {
            return
        }
        self.pushViewController(next, animated: true)
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
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
