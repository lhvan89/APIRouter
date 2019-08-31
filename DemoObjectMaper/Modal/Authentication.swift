//
//  Authentication.swift
//  DemoObjectMaper
//
//  Created by mac on 8/23/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import ObjectMapper

class Authentication: Mappable {
    var accessToken: String = ""
    var encryptedAccessToken: String = ""
    var expireInSeconds: Int = 0
    var shouldResetPassword: Bool = false
    var passwordResetCode: String?
    var userId: Int = 0
    var fullName: String = ""
    var phoneNumber: String = ""
    var emailAddress: String = ""
    var profilePicture: String = ""
    var tenantId: Int = 0
    var requiresTwoFactorVerification: Bool = false
    var twoFactorAuthProviders: [String]?
    var twoFactorRememberClientToken: String?
    var returnUrl: String?
    var refreshToken: String = ""
    var mustChooseTenant: Bool = false
    var tenants: [Tenant]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        accessToken                     <- map["accessToken"]
        encryptedAccessToken            <- map["encryptedAccessToken"]
        expireInSeconds                 <- map["expireInSeconds"]
        shouldResetPassword             <- map["shouldResetPassword"]
        passwordResetCode               <- map["passwordResetCode"]
        userId                          <- map["userId"]
        fullName                        <- map["fullName"]
        phoneNumber                     <- map["phoneNumber"]
        emailAddress                    <- map["emailAddress"]
        profilePicture                  <- map["profilePicture"]
        tenantId                        <- map["tenantId"]
        requiresTwoFactorVerification   <- map["requiresTwoFactorVerification"]
        twoFactorAuthProviders          <- map["twoFactorAuthProviders"]
        twoFactorRememberClientToken    <- map["twoFactorRememberClientToken"]
        returnUrl                       <- map["returnUrl"]
        refreshToken                    <- map["refreshToken"]
        mustChooseTenant                <- map["mustChooseTenant"]
        tenants                         <- map["tenants"]
    }
}
