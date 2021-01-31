//
//  GithubApi.swift
//  InterviewDemo
//
//  Created by Jiawei Zhang on 2021/1/31.
//

import Foundation
import RxSwift
import Alamofire

enum GetApiListError: Error {
    case cannotConvertServerResponse
}

class GithubApi {
    static let shared = GithubApi()
    
    let getList: Observable<(req: ApiRequest, res: ApiResponse)>
    
    private init() {
        getList = Observable<Int>.timer(.seconds(5), period: .seconds(5), scheduler: MainScheduler.instance)
            .flatMapLatest { index in
                return Observable<(req: ApiRequest, res: ApiResponse)>.create { observer -> Disposable in
                    print("Observable \(index)")
                    let request = AF.request(Router.getApis).responseJSON { response in
                        
                        guard response.error == nil else {
                            observer.onError(response.error!)
                            return
                        }
                        
                        guard let value = response.value as? [String: Any] else {
                            observer.onError(GetApiListError.cannotConvertServerResponse)
                            return
                        }
                        
                        let req = ApiRequest(url: response.request?.url?.absoluteString ?? "", timeStamp: Helper.getDateTimeString(from: Date()))
                        let res = ApiResponse(apis: value.map{ (k, v) -> Api in  Api(name: k, url: v as! String) })
                        observer.onNext((req, res))
                        observer.onCompleted()
                        
                    }
                    
                    return Disposables.create {
                        request.cancel()
                    }
                }
            }.share(replay: 10)
    }
}
