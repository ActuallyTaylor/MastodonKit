//
//  Payload.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/28/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

enum Payload {
    case parameters([Parameter]?)
    case media(MediaAttachment?, [Parameter]?)
    case empty
}

extension Payload {
    var items: [URLQueryItem]? {
        switch self {
        case .parameters(let parameters): return parameters?.compactMap(toQueryItem)
        case .media(_, let parameters): return parameters?.compactMap(toQueryItem)
        case .empty: return nil
        }
    }

    var data: Data? {
        switch self {
        case .parameters(let parameters):
            return parameters?
                .compactMap(toString)
                .joined(separator: "&")
                .data(using: .utf8)
        case .media(let mediaAttachment, let parameters):
            let mediaData = mediaAttachment.flatMap(Data.init) ?? Data()
            let parameterData = parameters.flatMap(Data.init) ?? Data()
            
            var combinedData = Data.init()
            combinedData.append(contentsOf: parameterData)
            combinedData.append(contentsOf: mediaData)
            
            return combinedData
        case .empty: return nil
        }
    }

    var type: String? {
        switch self {
        case .parameters(let parameters):
            return parameters.map { _ in "application/x-www-form-urlencoded; charset=utf-8" }
        case .media(let mediaAttachment, _):
            return mediaAttachment.map { _ in "multipart/form-data; boundary=MastodonKitBoundary" }
        case .empty: return nil
        }
    }
}
