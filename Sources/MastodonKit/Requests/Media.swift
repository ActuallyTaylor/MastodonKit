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
    }
    
    public static func update(id: String, description: String? = nil) -> Request<Attachment> {
        let localParameters = [
            Parameter(name: "description", value: description)
        ]
        let method = HTTPMethod.put(.parameters(localParameters))
        return Request<Attachment>(path: "/api/v1/media/\(id)", method: method)
    }
}
