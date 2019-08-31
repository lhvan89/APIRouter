//
//  APIManager.swift
//  DemoObjectMaper
//
//  Created by mac on 8/23/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class APIManager {
    static func executeRequest<T: Mappable>(_ returnType: T.Type, completionHandle: @escaping ((_ result: T?) -> Void)) {
        let url = "http://oplusapi.itpsolution.net/api/TokenAuth/Authenticate"
        let method: HTTPMethod = .post
        let parameters: Parameters = ["userNameOrEmailAddress": "vanlh@itpsolution.net", "password": "Thu234567#"]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<BaseResponse<T>>) in
            
            #if DEBUG
            guard let data = response.data, let dataJson = String(data: data, encoding: .utf8) else {return }
            guard let jsonResponse = dataJson.data(using: .utf8)?.prettyPrintedJSONString else { return }
            print("====================")
            print("url =", url)
            print("headers =", headers)
            print("parameters =", parameters)
            print("response =", jsonResponse)
            print("====================")
            #endif
            
            switch response.result {
            case .success:
                if response.response?.statusCode == 200 {
                    guard let value = response.result.value else { return }
                    if value.success ?? false {
                        completionHandle(value.result)
                    } else {
                        completionHandle(nil)
                    }
                } else {
                    completionHandle(nil)
                }
                break
            case .failure(let error):
                if error is AFError {
                    completionHandle(nil)
                }
                
                break
            }
        }
    }
}
