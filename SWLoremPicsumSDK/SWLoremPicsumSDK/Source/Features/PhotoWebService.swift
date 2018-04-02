//
//  PhotoWebService.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 02.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya

public enum PhotoWebServiceResult {
    case success(UIImage)
    case failure(Error)
}

public typealias Completion = (_ result: PhotoWebServiceResult) -> Void

public class PhotoWebService {

    public init() {}

    public func photo(completion: @escaping Completion) {

        let provider = MoyaProvider<LoremPicsumServerAPI>()
        provider.request(.photo(photoId: "2", width: 200, height: 300)) { result in
            switch result {
            case .success(let response):
                print("✋ response \(response)")
                print("✋ response \(response.data)")
                if let image = UIImage(data: response.data) {
                    completion(.success(image))
                } else {
                    completion(.failure(NSError(domain: "Parse error", code: 999, userInfo: nil)))
                }

            case .failure(let error):
                print("✋ error \(error)")
                completion(.failure(error))

            }
        }
    }

}
