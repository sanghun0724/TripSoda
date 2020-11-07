//
//  BuyingCodeViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/05.
//

import UIKit
import MessageUI

class BuyingCodeViewController: UIViewController,UIGestureRecognizerDelegate,UINavigationControllerDelegate,MFMailComposeViewControllerDelegate,UITextFieldDelegate{
    
    @IBOutlet var buyingcodeText:UITextField!
    
    let number = "01055671914"
    let theCode = "123456"
    var maxTag = 0
    var tbAccessoryView : UIToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        findMaxTFTag()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func findMaxTFTag() {
        self.view.subviews.forEach { (v) in
            if v is UITextField, v.tag > maxTag {
                maxTag = v.tag
            }
        }
    }
    
    func findTFWithTag(tag : Int) -> UITextField? {
        var retMe : UITextField?
        self.view.subviews.forEach { (v) in
            if v.tag == tag, let tf = v as? UITextField {
                retMe = tf
            }
        }
        return retMe
    }
    
    var curTag = 0
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        curTag = textField.tag
        if tbAccessoryView == nil {
            tbAccessoryView = UIToolbar.init(frame:
                                                CGRect.init(x: 0, y: 0,
                                                            width: self.view.frame.size.width, height: 44))
            let bbiPrev = UIBarButtonItem.init(title: "이전",
                                               style: .plain, target: self, action: #selector(doBtnPrev))
            //              let bbiNext = UIBarButtonItem.init(title: "Next", style: .plain,
            //                          target: self, action: #selector(doBtnNext))
            let bbiSpacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
            let bbiSubmit = UIBarButtonItem.init(title: "다음", style: .plain,
                                                 target: self, action: #selector(doBtnSubmit))
            tbAccessoryView?.items = [bbiPrev, bbiSpacer, bbiSubmit]
        }
        // set the tool bar as this text field's input accessory view
        textField.inputAccessoryView = tbAccessoryView
        return true
    }
    
    @objc
    func doBtnPrev() {
        // decrement or roll over
        curTag = curTag == 0 ? maxTag : curTag-1
        findTFWithTag(tag: curTag)?.becomeFirstResponder()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func doBtnSubmit() {
        check()
    }
    
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
    
    //구매코드 체크
    func check() {
        
        if self.buyingcodeText?.text == self.theCode {
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
            self.navigationController?.pushViewController(wrongView, animated: true)
        }
    }
    
}

//다음 버튼 추가
//extension UITextField {
//
//    @IBInspectable var doneAccessory: Bool{
//        get{
//            return self.doneAccessory
//        }
//        set (hasDone) {
//            if hasDone{
//                addDoneButtonOnKeyboard()
//            }
//        }
//    }
//
//    func addDoneButtonOnKeyboard()
//    {
//        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
//        doneToolbar.barStyle = .default
//
//        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let done: UIBarButtonItem = UIBarButtonItem(title: "다음", style: .done, target: self, action: #selector(self.doneButtonAction))
//
//        let items = [flexSpace, done]
//        doneToolbar.items = items
//        doneToolbar.sizeToFit()
//
//        self.inputAccessoryView = doneToolbar
//    }
//
//    //check 메소드가 안먹음,,
//    @objc func doneButtonAction()
//    {
//        let test = BuyingCodeViewController()
//        test.check()
//        self.endEditing(true)
//
//    }
//}
