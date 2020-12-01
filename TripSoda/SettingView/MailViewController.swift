//
//  MailViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/30.
//

import UIKit
import MessageUI

class MailViewController: UIViewController,MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        mailCompose()
        // Do any additional setup after loading the view.
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func mailCompose() {
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setToRecipients(["comxpzang@gmail.com"])
        mc.setSubject("TestApp for iOS")
        mc.setMessageBody("문의하시고자 하는 내용을 보내주세요~", isHTML: false)
        if MFMailComposeViewController.canSendMail() { self.present(mc, animated: true, completion: nil) }
        else { let alertController: UIAlertController = UIAlertController(title:"메일 보내기", message:"\n현재 디바이스에서 이메일을 보낼수가 없습니다. 설정에서 이메일 관련 설정을 확인해주세요", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "확인", style: .default, handler: { (alert: UIAlertAction!) in })
            alertController.addAction(defaultAction)
            alertController.modalPresentationStyle = .fullScreen
            present(alertController, animated: true, completion: nil) }

    
    }
   
}
