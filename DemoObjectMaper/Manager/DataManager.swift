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

class DataManager {
    
    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    static func executeRequest<T: Mappable>(_ returnType: T.Type, completionHandle: @escaping ((_ status: Status, _ result: T?) -> Void)) {
        
        if !isConnectedToInternet() {
            print("Không có kết nối")
            completionHandle(.failure, nil)
            return
        }
        
        let url = "http://oplusapi.itpsolution.net/api/TokenAuth/Authenticate"
        let method: HTTPMethod = .post
        let parameters: Parameters = ["userNameOrEmailAddress": "vanlh@itpsolution.nett", "password": "Thu234567#"]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<BaseResponse<T>>) in
            
            #if DEBUG
            guard let data = response.data, let dataJson = String(data: data, encoding: .utf8) else {return }
            guard let jsonResponse = dataJson.data(using: .utf8)?.prettyPrintedJSONString else {
                print("Unknown error")
                completionHandle(.failure, nil)
                return
            }
            print("====================")
            print("url =", url)
            print("headers =", headers)
            print("parameters =", parameters)
            print("response =", jsonResponse)
            print("====================")
            #endif
            
            switch response.result {
            case .success:
                guard let value = response.result.value else { return }
                if value.success {
                    completionHandle(.success, value.result)
                } else if value.unAuthorizedRequest {
                    print("unAuthorizedRequest")
                } else {
                    guard let error = value.error else { return }
                    print(error.message)
                    completionHandle(.failure, nil)
                }
                break
            case .failure:
                completionHandle(.failure, nil)
                break
            }
        }
    }
}
