//
//  ViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/05.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
    //FACEBOOK TESTID: 107758301141683 // PASSWORD: 123456@
    
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var codeVIew: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var tripSoda: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var codeButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desginCreated()
    }
    
    func desginCreated() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .algae
        
        tripSoda.textColor = .white
        
        
        loginView.layer.masksToBounds = true
        loginView.layer.cornerRadius = 13
       
        
        codeVIew.layer.masksToBounds = true
        codeVIew.layer.cornerRadius = 13
       // codeVIew.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
    
    
    @IBAction func goNext(sender:UIButton) {
        
    }
    @IBAction func preparForunwind(sender:UIStoryboardSegue) {
        
    }


}


















































        //접속토큰이 같을때 다시 로그인 x
//        if let token = AccessToken.current, !token.isExpired {
//            let token = token.tokenString
//
//            let request = FBSDKLoginKit.GraphRequest.init(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
//
//            request.start(completionHandler:{ connection,result,error in
//                print("\(result)")
//            })
//            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "tapbar")
//            guard let nextView = nextViewController else {
//                return
//            }
//
//            nextView.modalPresentationStyle = .fullScreen
//            self.present(nextView, animated: true, completion: nil)
//        }
        
//        //다를때 로그인화면 보여주기
//        else {
//            let loginButton = FBLoginButton()
//            loginButton.center = view.center
//            loginButton.delegate = self
//            loginButton.permissions = ["public_profile","email"]
//            view.addSubview(loginButton)
//
//
//            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "tapbar")
//            guard let nextView = nextViewController else {
//                return
//            }
//
//            nextView.modalPresentationStyle = .fullScreen
//            self.present(nextView, animated: true, completion: nil)
            //        NotificationCenter.default.addObserver(forName: .AccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            //
            //            // Print out access token
            //            print("FB Access Token: \(String(describing: AccessToken.current?.tokenString))")
            //        }
        
    
    
    //로그인 마친후
//    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
//        let token = result?.token?.tokenString
//
//        let request = FBSDKLoginKit.GraphRequest.init(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
//
//        request.start(completionHandler:{ connection,result,error in
//            print("\(result)")
//
//            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "tapbar")
//            guard let nextView = nextViewController else {
//                return
//            }
//
//            nextView.modalPresentationStyle = .fullScreen
//            self.present(nextView, animated: true, completion: nil)
//        })
//    }
    
    //로그아웃 한후
//    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
//
//    }
    
   
