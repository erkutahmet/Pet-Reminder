//
//  SohbetArayuzViewController.swift
//  Pet Reminder
//
//  Created by Ahmet Erkut on 9.04.2023.
//

import UIKit
import MessageKit

struct Sender:SenderType{
    var senderId: String
    var displayName: String
}

struct Message: MessageType{
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}

class SohbetArayuzViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {

    // sender(yollayan) ile bir değişken oluşumu senderID!!
    let mevcutKullanici = Sender(senderId: "self", displayName: "Ahmet")
    let digerKullanici = Sender(senderId: "other", displayName: "Veteriner Murat")

    // bu datayı backendden alıcaz
    var mesajlar = [MessageType]()

    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .dark
        if let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout {
            layout.setMessageOutgoingAvatarSize(.zero)
            layout.setMessageIncomingAvatarSize(.zero)
        }
        setUpMessages()
        //mesajların kaynak verisi
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.reloadData()
    }

    var currentSender: SenderType {
        return mevcutKullanici
    }
    
    var otherSender: SenderType {
        return digerKullanici
    }

    //yollanılan mesajlar için mesaj kutusu(item)
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return mesajlar[indexPath.section]
    }

    //mesaj sayısı
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return mesajlar.count
    }
    
    func setUpMessages(){
        mesajlar.append(Message(sender: currentSender,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Selamlar.")))
        mesajlar.append(Message(sender: otherSender,
                                messageId: "2",
                                sentDate: Date().addingTimeInterval(-70000),
                                kind: .text("Selamlar, nasıl gidiyor?")))
        mesajlar.append(Message(sender: currentSender,
                                messageId: "3",
                                sentDate: Date().addingTimeInterval(-66400),
                                kind: .text("İyidir, sizden?")))
        mesajlar.append(Message(sender: otherSender,
                                messageId: "4",
                                sentDate: Date().addingTimeInterval(-56400),
                                kind: .text("İyi ne olsun. Pamuk nasıl iyi mi?")))
        mesajlar.append(Message(sender: currentSender,
                                messageId: "5",
                                sentDate: Date().addingTimeInterval(-46400),
                                kind: .text("Her şey yolunda iyi hissediyor, teşekkürler.")))
        mesajlar.append(Message(sender: otherSender,
                                messageId: "6",
                                sentDate: Date().addingTimeInterval(-26400),
                                kind: .text("Biz teşekkür ederiz.")))
    }
}
