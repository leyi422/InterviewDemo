//
//  ResponseContentController.swift
//  InterviewDemo
//
//  Created by Jiawei Zhang on 2021/1/31.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class ResponseContentController: UITableViewController {
    
    var apiList: [Api] = []
    
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GithubApi.shared.getList.subscribe(onNext: {
            [weak self] in
            print("subscribe1")
            self?.apiList = $0.res.apis
            self?.tableView.reloadData()
        }).disposed(by: bag)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApiItem", for: indexPath)
        
        let apiLabel = cell.viewWithTag(1) as? UILabel
        apiLabel?.text = apiList[indexPath.row].name
        let urlLabel = cell.viewWithTag(2) as? UILabel
        urlLabel?.text = apiList[indexPath.row].url

        return cell
    }

}
