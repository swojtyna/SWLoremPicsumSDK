//
//  PhotosListParser.swift
//  SWLoremPicsumSDK
//
//  Created by Sebastian Wojtyna on 06.04.2018.
//  Copyright © 2018 Sebastian Wojtyna. All rights reserved.
//

import Foundation
import Result

public typealias PhotosListParserCompletion = (_ result: Result<[PhotoElement], SWError>) -> Void

class PhotosListParser {

    func parse(_ data: Data, completion: PhotosListParserCompletion) {
        guard let photosList = try? JSONDecoder().decode([PhotoElement].self, from: data) else {
            completion(.failure(.parserError(reason: .objectMapping)))

            return
        }

        completion(.success(photosList))
    }

}
