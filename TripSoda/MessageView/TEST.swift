//
//  TEST.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/12.
//

import UIKit

class TEST: UINavigationController{
   
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let massageChatViewDelegate = MessageChatViewController()
        let MssagerViewDelegate = MessagerViewController()
        massageChatViewDelegate.TESTViewDelegate = self
        MssagerViewDelegate.testViewDelegate = self
        
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
