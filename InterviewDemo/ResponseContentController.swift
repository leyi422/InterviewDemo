//
//  ResponseContentController.swift
//  InterviewDemo
//
//  Created by Jiawei Zhang on 2021/1/31.
//

import UIKit

class ResponseContentController: UITableViewController {
    
    var apis: [[String: String]] = [
        [
            "api": "current_user_url",
            "url": "https://api.github.com/user"
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
        return apis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApiItem", for: indexPath)
        
        let apiLabel = cell.viewWithTag(1) as? UILabel
        apiLabel?.text = apis[indexPath.row]["api"]
        let urlLabel = cell.viewWithTag(2) as? UILabel
        urlLabel?.text = apis[indexPath.row]["url"]

        return cell
    }

}
