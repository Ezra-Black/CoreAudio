//
//  TableViewController.swift
//  AVAudioPlayer
//
//  Created by Ezra Black on 6/6/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit
let songURL = Bundle.main.url(forResource: "piano", withExtension: "mp3")!
var audioToList: [URL] = [songURL]

class TableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return audioToList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = audioToList[indexPath.row].description
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add" {
            
        } else if segue.identifier == "show" {
            guard let recordDetailV = segue.destination as? AudioRecorderController,
            let path = self.tableView.indexPathForSelectedRow else { return }
            recordDetailV.recordingURL = audioToList[path.row].baseURL
        }
    }
    

}
