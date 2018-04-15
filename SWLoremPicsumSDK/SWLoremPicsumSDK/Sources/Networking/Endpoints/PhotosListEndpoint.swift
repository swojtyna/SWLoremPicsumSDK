//
//  PhotosListServerAPI.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 06.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya

enum PhotosListEndpoint {
    case photosList
}

extension PhotosListEndpoint: TargetType {

    var baseURL: URL { return URL(string: "https://picsum.photos/")! }

    var path: String {
        switch self {
        case .photosList:
            return "/list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .photosList:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .photosList:
            return Data()
        }
    }

    var task: Task {
        switch self {
        case .photosList:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        switch self {
        case .photosList:
            return nil
        }
    }

}
