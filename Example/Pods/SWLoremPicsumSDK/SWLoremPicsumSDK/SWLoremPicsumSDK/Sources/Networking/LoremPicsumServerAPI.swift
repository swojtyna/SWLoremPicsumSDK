//
//  LoremPicsumServerAPI.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 02.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya

enum LoremPicsumServerAPI {

    case photo(photoId: String, width: Int, height: Int)
    case photosList
}

extension LoremPicsumServerAPI: TargetType {

    var baseURL: URL { return URL(string: "https://picsum.photos/")! }

    var path: String {
        switch self {
        case .photo(let photoId, let width, let height):
            return "/\(width)/\(height)?image=\(photoId)"
        case .photosList:
            return "/list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .photo, .photosList:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .photo, .photosList:
            return Data()
        }
    }

    var task: Task {
        switch self {
        case .photo, .photosList:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        switch self {
        case .photo, .photosList:
            return nil
        }
    }

}
