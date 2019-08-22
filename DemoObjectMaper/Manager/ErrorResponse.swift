//
//  ErrorResponse.swift
//  DemoObjectMaper
//
//  Created by mac on 8/23/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import ObjectMapper

class ErrorResponse: Mappable {
    var code: Int?
    var message: String?
    var detail: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        detail <- map["detail"]
    }
}
