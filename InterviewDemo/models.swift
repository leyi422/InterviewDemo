//
//  Api.swift
//  InterviewDemo
//
//  Created by Jiawei Zhang on 2021/1/31.
//

import Foundation

struct ApiRequest {
    let url: String
    let timeStamp: String
}

struct Api {
    let name: String
    let url: String
}

struct ApiResponse {
    let apis: [Api]
}
