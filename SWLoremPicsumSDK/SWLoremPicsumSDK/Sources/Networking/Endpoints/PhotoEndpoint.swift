//
//  PhotoServerAPI.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 06.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya

enum PhotoEndpoint {
    case photo(photoId: String, width: Int, height: Int)
}

extension PhotoEndpoint: TargetType {

    var baseURL: URL { return URL(string: "https://picsum.photos/")! }

    var path: String {
        switch self {
        case .photo(let photoId, let width, let height):
            return "/\(width)/\(height)?image=\(photoId)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .photo:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .photo:
            return Data()
        }
    }

    var task: Task {
        switch self {
        case .photo:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        switch self {
        case .photo:
            return nil
        }
    }

}
