//
//  Router.swift
//  InterviewDemo
//
//  Created by Jiawei Zhang on 2021/1/31.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case getApis
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .getApis:
                return .get
            }
        }
        
        var params: [String: Any]? {
            switch self {
            case .getApis:
                return nil
            }
        }
        
        var url: URL {
            switch self {
            case .getApis:
                return URL(string: "https://api.github.com")!
            }
        }
        
        var request = URLRequest(url: url)
        request.method = method
        let encoding = JSONEncoding.default
        return try encoding.encode(request, with: params)
    }
}
