//
//  Media.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

/// `Media` requests.
public enum Media {
    /// Uploads a media attachment.
    ///
    /// - Parameter mediaAttachment: The media attachment to upload.
    /// - Returns: Request for `Attachment`.
    public static func upload(media mediaAttachment: MediaAttachment, description: String? = nil) -> Request<Attachment> {
        let localParameters = [
            Parameter(name: "description", value: description)
        ]
        let method = HTTPMethod.post(.media(mediaAttachment, localParameters))
        return Request<Attachment>(path: "/api/v2/media", method: method)
        
//        let rangeParameters = range.parameters(limit: between(1, and: 40, default: 20)) ?? []
//        let localParameters = [
//            Parameter(name: "q", value: query),
//            Parameter(name: "type", value: type?.rawValue),
//            Parameter(name: "resolve", value: resolve.flatMap(trueOrNil)),
//            Parameter(name: "following", value: following.flatMap(trueOrNil)),
//            Parameter(name: "account_id", value: accountId),
//            Parameter(name: "exclude_unreviewed", value: excludeUnreviewed.flatMap(trueOrNil)),
//        ]
//
//        let method = HTTPMethod.get(.parameters(localParameters + rangeParameters))
//        return Request<Results>(path: "/api/v2/search", method: method)

    }
}
