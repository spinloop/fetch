//
//  ViewController.swift
//  Fetch
//
//  Created by Chris Eldridge on 10/17/16.
//  Copyright © 2016 Chris Eldridge. All rights reserved.
//

import UIKit

import Alamofire

class ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        Alamofire.request("https://www.mojotech.com/people.json").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

