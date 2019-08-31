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
        // Do any additional setup after loading the view.
        
        APIManager.executeRequest(AuthenRespone.self) { [weak self] (result) in
            guard let strongSelf = self else { return }
            guard let result = result else { return }
            print(result.accessToken ?? "")
            
            guard let tennants = result.tenants else { return }
            print(tennants[0].tenancyName ?? "")
        }
    }


}

