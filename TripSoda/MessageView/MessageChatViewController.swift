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
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.dataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
    }
    
    func currentSender() -> SenderType {
        <#code#>
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        <#code#>
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        <#code#>
    }
    
    

    
    
    
   
    

  

}
