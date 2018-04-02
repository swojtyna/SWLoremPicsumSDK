//
//  ViewController.swift
//  SWLoremPicsumSDK-Example
//
//  Created by Sebastian Wojtyna on 02.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import UIKit
import SWLoremPicsumSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let photo = PhotoWebService().photo()
        let photosList = PhotosListWebService().photos()

        print("Welcome 😀")
        print("Response from PhotoWebService: \(photo)")
        print("Response from PhotosListWebService: \(photosList)")
    }

}
