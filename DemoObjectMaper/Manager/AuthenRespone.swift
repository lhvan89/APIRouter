//
//  AuthenRespone.swift
//  DemoObjectMaper
//
//  Created by mac on 8/23/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import ObjectMapper

class AuthenRespone: Mappable {
    var accessToken: String?
    var encryptedAccessToken: String?
    var expireInSeconds: Int?
    var shouldResetPassword: Bool?
    var passwordResetCode: String?
    var userId: Int?
    var fullName: String?
    var phoneNumber: String?
    var emailAddress: String?
    var profilePicture: String?
    var tenantId: Int?
    var requiresTwoFactorVerification: Bool?
    var twoFactorAuthProviders: [String]?
    var twoFactorRememberClientToken: String?
    var returnUrl: String?
    var refreshToken: String?
    var mustChooseTenant: Bool?
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
