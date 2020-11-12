//
//  MessageViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/12.
//

import UIKit

class MessageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "testMesaage"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let next = self.storyboard?.instantiateViewController(identifier: "chat") else {
            return
        }
        
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
        
    }

}
