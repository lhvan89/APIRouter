//
//  Tenant.swift
//  DemoObjectMaper
//
//  Created by mac on 8/23/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import ObjectMapper

class Tenant: Mappable {
    var id: Int?
    var tenancyName: String?
    var name: String?
    var isDefaultTenant: Bool?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id              <- map["id"]
        tenancyName     <- map["tenancyName"]
        name            <- map["name"]
        isDefaultTenant <- map["isDefaultTenant"]
    }
}
