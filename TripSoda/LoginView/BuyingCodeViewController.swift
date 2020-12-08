//
//  BuyingCodeViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/05.
//

import UIKit
import MessageUI
import PinCodeTextField

class BuyingCodeViewController: UIViewController,UIGestureRecognizerDelegate,UINavigationControllerDelegate,MFMailComposeViewControllerDelegate,UITextFieldDelegate,PinCodeTextFieldDelegate {
    
    @IBOutlet var buyingcodeText:PinCodeTextField!
    
    let number = "01055671914"
    let theCode = "12345"
    var maxTag = 0
    var tbAccessoryView : UIToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(noti:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
       
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(noti:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillDisappear(noti:NSNotification) {
      check()
    }
    
    
    //MARK: Button Method
    // 통화걸기
    @IBAction func telePhone() {
        guard let number = URL(string: "tel://" + self.number) else { return }
        UIApplication.shared.open(number)
    }
    
    //메일 기능은 디바이스에서만 작동, 시뮬레이션 x
    @IBAction func sendFeedbackButtonTapped(_ sender: Any) {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        composeVC.setToRecipients(["exampleEmail@email.com"])
        composeVC.setSubject("Message Subject")
        composeVC.setMessageBody("Message content.", isHTML: false)
        
        self.present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        //추후
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Code Check Method
    //구매코드 체크
    func check() {
        if self.buyingcodeText.text == self.theCode {
            UserInformation.shared.buyingPassword = self.buyingcodeText.text
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "tapbar")
            guard let nextView = nextViewController else {
                return
            }
            self.performSegue(withIdentifier: "go", sender: self)
            nextView.modalPresentationStyle = .fullScreen
            
        }
        else {
            let wrongViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "wrong")
            guard let wrongView = wrongViewController else {
                return
            }
            wrongView.modalPresentationStyle = .fullScreen
            self.present(wrongView, animated: true, completion: nil)
        }
    }
    
}


