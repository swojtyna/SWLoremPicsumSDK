//
//  PhotosListWebService.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 02.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Moya

public enum PhotosListResult {
    case success([PhotoElement])
    case failure(Error)
}

public typealias PhotosListCompletion = (_ result: PhotosListResult) -> Void

public class PhotosListWebService {

    public init() {}

    public func photosList(completion: @escaping PhotosListCompletion) {

        let provider = MoyaProvider<LoremPicsumServerAPI>()
        //        provider.request(.photo(photoId: "2", width: 200, height: 300)) { (result) in
        provider.request(.photosList) { result in
            switch result {
            case .success(let response):
                print("✋ response \(response)")
                print("✋✋ response \(response.data)")

                if let photo = try? JSONDecoder().decode(Photo.self, from: response.data) {
                    completion(.success(photo))
                } else {
                    completion(.failure(NSError(domain: "Parse error", code: 999, userInfo: nil)))
                }
                //                completion(.success([]))

            case .failure(let error):
                print("✋ error \(error)")
                completion(.failure(error))

            }
        }

    }

}
