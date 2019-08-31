//
//  APIRouting.swift
//  DemoObjectMaper
//
//  Created by Van Le on 8/31/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case login(parameters: Parameters)
    
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
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        for (key, value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        switch self {
        case .login(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
}
