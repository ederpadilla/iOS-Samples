//
//  TwitterViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 09/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit
import Firebase

class TwitterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mPostTable: UITableView!
    var userUid : String?
    var postsList = [PostObject]()
    var ref = DatabaseReference.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("User uid 😇😇😇😇😇 \(userUid!)")
        self.postsList.append(PostObject(posttext: " ", userUid: "@#$2@", postDate: " ", postImage: ""))
        mPostTable.delegate = self
        mPostTable.dataSource = self
        self.ref = Database.database().reference()
        getPostFromFireBase()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("🌮🌮🌮🌮🌮🌮🌮🌮🌮🌮La lista es \(postsList[indexPath.row])")
        let post = postsList[indexPath.row]
        if (post.userUid! == "@#$2@"){
            print("Si lo deberia de inflar 😇😇😇😇")
            let cellAdd = mPostTable.dequeueReusableCell(withIdentifier: "postCell", for : indexPath) as! PostsTableViewCell
            cellAdd.userUid = userUid!
            cellAdd.main = self
            return cellAdd
        } else if(post.postImage == "no image"){
            let noImageCell = tableView.dequeueReusableCell(withIdentifier: "noImagePost", for: indexPath) as! PostWithOutImageTableViewCell
            noImageCell.setText(postText: post.posttext!)
            return noImageCell
        }else{
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "postWithImage", for: indexPath) as! PostWithImageAndTextTableViewCell
            imageCell.setText(post: post)
            return imageCell
        }
    }
    func getPostFromFireBase(){
        self.ref.child("Posts").queryOrdered(byChild: "postDate").observe(.value , with: {
            (snapshot) in
            self.postsList.removeAll()
            self.postsList.append(PostObject(posttext: " ", userUid: "@#$2@", postDate: " ", postImage: ""))
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapshot{
                    print("snap😇😇😇😇😇😇😇 \(snap.description)")
                    if let postDictonary = snap.value as? [String : Any]{
                        var postText : String?
                        if let postTextFromFb = postDictonary["text"] as? String{
                            postText = postTextFromFb
                        }
                        var postImage : String?
                        if let postimageFromFb = postDictonary["imagePath"] as? String{
                            postImage = postimageFromFb
                        }
                        var postDate : String?
                        if let postDateFromFb = postDictonary["postDate"] as? String{
                            postDate = postDateFromFb
                        }
                        var userUid : String?
                        if let postuserUidFromFb = postDictonary["userUid"] as? String{
                            userUid = postuserUidFromFb
                        }
                        self.postsList.append(PostObject(posttext: postText!, userUid: userUid!, postDate: "", postImage: postImage!))
                    }
                }
                self.mPostTable.reloadData()
            }
        })
    }
}
