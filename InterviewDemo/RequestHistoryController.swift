//
//  RequestHistoryController.swift
//  InterviewDemo
//
//  Created by Jiawei Zhang on 2021/1/31.
//

import UIKit
import RxSwift

class RequestHistoryController: UITableViewController {
    
    var requestList: [ApiRequest] = []
    
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GithubApi.shared.getList.subscribe(onNext: {
            [weak self] in
            print("subscribe2")
            self?.requestList.insert($0.req, at: 0)
            self?.tableView.reloadData()
        }).disposed(by: bag)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryItem", for: indexPath)

        let requestUrlLabel = cell.viewWithTag(1) as? UILabel
        requestUrlLabel?.text = requestList[indexPath.row].url
        let timeLabel = cell.viewWithTag(2) as? UILabel
        timeLabel?.text = requestList[indexPath.row].timeStamp

        return cell
    }

}
