//
//  BaseResponse.swift
//  DemoObjectMaper
//
//  Created by mac on 8/23/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse<T: Mappable>: Mappable {
    var result: T?
    var success: Bool = false
    var error: ErrorResponse?
    var unAuthorizedRequest: Bool = false
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        result              <- map["result"]
        success             <- map["success"]
        error               <- map["error"]
        unAuthorizedRequest <- map["unAuthorizedRequest"]
    }
}
