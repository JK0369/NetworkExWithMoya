//
//  ViewController.swift
//  NetworkEx
//
//  Created by 김종권 on 2021/08/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = ListUserRequest(page: 2)
        ListUserAPI.getUserList(request: request) { response, error in
            guard let response = response else {
                print(error ?? #function)
                return
            }

            let listUser = response
            print(listUser)
        }

    }


}

