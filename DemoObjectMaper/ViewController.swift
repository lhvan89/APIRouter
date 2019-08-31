//
//  ViewController.swift
//  DemoObjectMaper
//
//  Created by mac on 8/22/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("show loading")
        loginRequest("vanlh@itpsolution.net", "Thu234567#")
    }
    
    func loginRequest(_ phoneOrEmail: String, _ password: String) {
        DataManager.executeRequest(AuthenRouter.login(phoneOrEmail, password), Authentication.self) { (status, result) in
            print("hide loading")
            switch status {
            case .success:
                guard let result = result else { return }
                print(result.accessToken)
                guard let tennants = result.tenants else { return }
                print(tennants[0].tenancyName ?? "")
                break
            case .failure:
                break
            }
        }
    }
}
