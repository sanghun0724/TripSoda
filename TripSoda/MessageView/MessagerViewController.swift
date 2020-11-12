//
//  MessageViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/12.
//

import UIKit

class MessagerViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.profileLabel.text = "김산순(다음일정:1건)"
        cell.messageLabel.text = "ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let next = self.storyboard?.instantiateViewController(identifier: "through") else {
            return
        }
        
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
        
    }

}
