//
//  MessageViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/12.
//

import UIKit

class MessagerViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView:UITableView!
    @IBOutlet var searchView:UIView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.layer.shadowColor = UIColor.systemGray.cgColor
        searchView.layer.shadowOpacity = 0.5
        searchView.layer.shadowRadius = 3
        searchView.layer.shadowOffset = (CGSize(width: 0, height: 3))
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell:MessageViewCell = tableView.dequeueReusableCell(withIdentifier: "profilcell", for: indexPath) as? MessageViewCell else {
            return UITableViewCell()
        }
        //cell.profileLabel.text = "김산순(다음일정:1건)"
        cell.messageLabel.text = "ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
        guard let next = self.storyboard?.instantiateViewController(identifier: "chat") else {
            return
        }
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func buttonImage () {
       //지금은 그냥 -> 나중에는 button 클래스따로 만들거나 테이불뷰  인덱스 활용
        guard let profile = storyboard?.instantiateViewController(withIdentifier: "profile") else {
            return
        }
        profile.modalPresentationStyle = .fullScreen
        self.present(profile, animated: true, completion: nil)
    }
}
