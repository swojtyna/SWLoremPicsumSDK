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

        print("Welcome 😀")

        PhotoWebService().photo { result in
            switch result {
            case .success(let image):
                print("👻 Recived image: \(image)")
                self.addSimplePhoto(image)
            case .failure(let error):
                print("💣 Error: \(error)")
            }
        }

    }

    private func addSimplePhoto(_ image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.center = view.center
        view.addSubview(imageView)
    }

}
