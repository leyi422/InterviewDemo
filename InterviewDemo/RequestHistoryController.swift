//
//  RequestHistoryController.swift
//  InterviewDemo
//
//  Created by Jiawei Zhang on 2021/1/31.
//

import UIKit

class RequestHistoryController: UITableViewController {
    
    var hitstory: [[String: String]] = [
        [
            "requestUrl": "https://api.github.com",
            "time": "2021/01/31 10:30:00"
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitstory.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryItem", for: indexPath)

        let requestUrlLabel = cell.viewWithTag(1) as? UILabel
        requestUrlLabel?.text = hitstory[indexPath.row]["requestUrl"]
        let timeLabel = cell.viewWithTag(2) as? UILabel
        timeLabel?.text = hitstory[indexPath.row]["time"]

        return cell
    }

}
