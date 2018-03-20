//
//  FireBaseChatAppViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 08/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit
import Firebase
class FireBaseChatAppViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var ref = DatabaseReference.init()

    @IBOutlet weak var mChatsTable: UITableView!
    @IBOutlet weak var mChatTextInput: UITextField!
    var chatsList = [ChatModel]()
    var userName : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        mChatsTable.delegate = self
        mChatsTable.dataSource = self
        logInAnon()
        ref = Database.database().reference()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func loadChatRoom(){
        self.ref.child("Chat").queryOrdered(byChild: "date").observe(.value, with: {
            (snapshot) in
            self.chatsList.removeAll()
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
//                let chatData : [String: AnyObject] = snapshot
                if !snapshot.isEmpty{
                    for snap in snapshot {
                        if let postData = snap.value as? [String : AnyObject]{
                            let nickNameFromFireBase = postData["name"] as? String
                            let messageFromFireBase = postData["message"] as? String
                            var posDateFromFireBase : CLong?
                            if let  postDateIn = postData["date"] as? CLong{
                                posDateFromFireBase = postDateIn
                            }
                            self.chatsList.append(ChatModel(nickName: nickNameFromFireBase!, message: messageFromFireBase!, date: "\(posDateFromFireBase!)"))
                        }
                    }
                    self.mChatsTable.reloadData()
                    let indexPath = IndexPath(row: self.chatsList.count-1, section: 0)
                    self.mChatsTable.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
                
            }
        })
    }
    func logInAnon(){
        Auth.auth().signInAnonymously(){
            (user,error) in
            if let error = error {
             print("🧐🧐🧐🧐🧐Can not log in")
            }else{
                self.loadChatRoom()
                print("🌮🌮🌮🌮🌮🌮User id \(user?.uid)")
            }
        }
    }
    @IBAction func mBuSend(_ sender: Any) {
        let dic = [ "message" : mChatTextInput.text,"name" : userName! ,"date" : ServerValue.timestamp()] as [String : Any]
        self.ref.child("Chat").childByAutoId().setValue(dic)
        mChatTextInput.text = ""
        self.view.endEditing(true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ChatTableViewCell = mChatsTable.dequeueReusableCell(withIdentifier: "cellChat", for: indexPath) as! ChatTableViewCell
        cell.setChat(chat: chatsList[indexPath.row])
        return cell
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
