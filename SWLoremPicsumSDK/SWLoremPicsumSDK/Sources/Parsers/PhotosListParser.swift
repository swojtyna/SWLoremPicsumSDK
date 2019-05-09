//
//  PhotosListParser.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 06.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation

public typealias PhotosListParserCompletion = (_ result: Result<[PhotoElement], SWError>) -> Void

public protocol PhotosListParserProtocol {
    func parse(_ data: Data, completion: PhotosListParserCompletion)
}

class PhotosListParser: PhotosListParserProtocol {

    func parse(_ data: Data, completion: PhotosListParserCompletion) {
        let decoder = JSONDecoder()

        do {
            let photosList = try decoder.decode([PhotoElement].self, from: data)
            completion(.success(photosList))
        } catch let error {
            completion(.failure(.parserError(reason: .objectMapping(error: error))))
        }
    }

}
