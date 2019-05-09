//
//  PhotoElement.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 02.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation

public struct PhotoElement: Codable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let downloadURL: String?

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
