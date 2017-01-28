//
//  ViewController.swift
//  notes2
//
//  Created by Marek Newton on 1/26/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var notes = [Note]()
    var rows = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = getTranscriptions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        var offset = tableView.contentOffset
        offset.y = tableView.contentSize.height + tableView.contentInset.bottom - tableView.bounds.size.height
        tableView.setContentOffset(offset, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

            
        let label = cell?.viewWithTag(1) as! UILabel
        label.text = notes[indexPath.row].content
            
        if(notes[indexPath.row].done == true) {
                cell?.backgroundColor = UIColor.green
        } else {
                cell?.backgroundColor = UIColor.white
        }
            
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = self.tableView.indexPathForSelectedRow?.row
        
        updateDone(done: !notes[index!].done, note: notes[index!])
        
        tableView.reloadData()
    }
    
}

