//
//  Manager.swift
//  DemoObjectMaper
//
//  Created by mac on 8/23/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class Manager {
    static func executeRequest<T: Mappable>(_ returnType: T.Type, completionHandle: @escaping ((_ result: T?) -> Void)) {
        let url = "http://oplusapi.itpsolution.net/api/TokenAuth/Authenticate"
        let method: HTTPMethod = .post
        let parameters: Parameters = ["userNameOrEmailAddress": "vanlh@itpsolution.net", "password": "Thu234567#"]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<BaseResponse<T>>) in
            switch response.result {
            case .success:
                if response.response?.statusCode == 200 {
                    if (response.result.value?.success)! {
                        completionHandle((response.result.value?.result)!)
                    } else {
//                        let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.API_ERROR, (response.result.value?.code)!, (response.result.value?.message)!)
                        completionHandle(nil)
                    }
                } else {
//                    let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, (response.response?.statusCode)!, "Request is error!")
                    completionHandle(nil)
                }
                break
            case .failure(let error):
                if error is AFError {
//                    let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, error._code, "Request is error!")
                    completionHandle(nil)
                }
                
                break
            }
        }
    }
}
