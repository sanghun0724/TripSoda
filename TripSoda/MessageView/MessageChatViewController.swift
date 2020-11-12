//
//  MessageChatViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/12.
//

import UIKit
import MessageKit


struct Sender:SenderType {
    var senderId: String
    var displayName: String
}
struct Message:MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class MessageChatViewController: MessagesViewController,MessagesDataSource, MessagesLayoutDelegate,MessagesDisplayDelegate {
    
    
    let currentUser = Sender(senderId: "self", displayName: "나")
    
    let otherUser = Sender(senderId: "other", displayName: "택시기사")
    
    var messages = [MessageType]()
    
    @IBAction func cancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-84600), kind: .text("안녕하세여어어어")))
        messages.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-74600), kind: .text("택시택시택시")))
        messages.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-64600), kind: .text("ㅈ아밪앚ㅂ앚바아")))
        messages.append(Message(sender: otherUser, messageId: "4", sentDate: Date().addingTimeInterval(-54600), kind: .text(";;;;;;;;;;;;;;;")))
        messages.append(Message(sender: currentUser, messageId: "5", sentDate: Date().addingTimeInterval(-44600), kind: .text("안녕하세여어어어")))
        messages.append(Message(sender: otherUser, messageId: "6", sentDate: Date().addingTimeInterval(-34600), kind: .text("안녕하세여어어어")))
        messages.append(Message(sender: currentUser, messageId: "7", sentDate: Date().addingTimeInterval(-24600), kind: .text("안녕하세여어어어")))
        
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
       
    }
    
    override func viewDidLayoutSubviews() {
        self.messagesCollectionView.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 70, right: 0)
    }
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    

    
    
    
   
    

  

}
