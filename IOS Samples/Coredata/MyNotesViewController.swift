//
//  MyNotesViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 01/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit
import CoreData

class MyNotesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var mTableViewList: UITableView!
     var noteList = [MyNotes]()
    override func viewDidLoad() {
        super.viewDidLoad()
          self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Notes", style: .done, target: self,action: #selector(actionTest(sender:)))
        loadNotes()
        mTableViewList.delegate = self
        mTableViewList.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NotesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellNote", for : indexPath) as! NotesTableViewCell
        cell.setNotes(note: noteList[indexPath.row])
        cell.mBuDelete.tag = indexPath.row
        cell.mBuDelete.addTarget(self, action: #selector(deleteNote(_:)), for: .touchUpInside)
        cell.mBuEdit.tag = indexPath.row
        cell.mBuEdit.addTarget(self, action: #selector(editNote(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func loadNotes(){
        let fetchRequest : NSFetchRequest<MyNotes> = MyNotes.fetchRequest()
        do{
            noteList = try context.fetch(fetchRequest)
            mTableViewList.reloadData()
        }
        catch {
            print("😡😡😡😡Error \(error)")
        }
    }
    @objc func deleteNote(_ sender : UIButton){
        context.delete(noteList[sender.tag])
        loadNotes()
    }
    @objc func editNote(_ sender : UIButton){
        performSegue(withIdentifier: "changeView", sender: noteList[sender.tag])
    }
    @objc func actionTest(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "changeView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeView"{
            if let addOrEdit = segue.destination as? CoreDataViewController{
                if let myNote = sender as? MyNotes {
                    addOrEdit.editNote = myNote
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        loadNotes()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
