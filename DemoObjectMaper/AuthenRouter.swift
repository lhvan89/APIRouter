//
//  AuthenticationRouter.swift
//  DemoObjectMaper
//
//  Created by Van Le on 8/31/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import Alamofire

enum AuthenRouter: URLRequestConvertible {
    
    case login(_ phoneOrEmail: String, _ password: String)
    
    static let baseURLString = "http://oplusapi.itpsolution.net"
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "/api/TokenAuth/Authenticate"
        }
    }
    
    var headers: HTTPHeaders {
        let headers = ["Content-Type": "application/json"]
        switch self {
        case .login:
            break
        }
        return headers
    }
    
    var parameters: Parameters {
        switch self {
        case .login(let phoneOrEmail, let password):
            return [
                "userNameOrEmailAddress": phoneOrEmail,
                "password": password
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try AuthenRouter.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        for (key, value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        switch self {
        case .login:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
