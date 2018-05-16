//
//  PhotoElement.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 02.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation

enum Format: String, Codable {
    case jpeg
    case png
}

public struct PhotoElement: Codable {
    let format: Format
    let width, height: Int
    let filename: String
    let id: Int
    let author: String
    let authorUrl: String
    let postUrl: String
}
