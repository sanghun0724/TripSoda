//
//  SettingViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/13.
//

import UIKit

class SettingViewController:UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func handleSwich(_ sender:UISwitch) {
        if sender.isOn {
            print("")
        } else {
            print("")
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            guard let noti = storyboard?.instantiateViewController(withIdentifier: "noti") else {
                return
            }
            self.navigationController?.pushViewController(noti, animated: true)
        case 1:
            print("언어")
        case 2:
            print("이용약관")
        case 3:
            print("마케팅 수신동의")
        case 4:
            print("Push알림동의")
        case 5:
            self.performSegue(withIdentifier: "unwind", sender: self)
        case 6:
            guard let mail = storyboard?.instantiateViewController(withIdentifier: "mail") else {
                return
            }
            self.navigationController?.pushViewController(mail, animated: true)
        default:
            print("something wrong")
        }
    }
}
