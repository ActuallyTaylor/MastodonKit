//
//  Tags.swift
//  MastodonKit
//
//  Created by Zachary Lineman on 1/20/23.
//

import Foundation
import Foundation

/// `Tags` requests.
public enum Tags {
    /// Fetches a tag.
    /// Show a hashtag and its associated information.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Request for `Status`.
    public static func tag(id: String) -> Request<Tag> {
        return Request<Tag>(path: "/api/v1/tags/\(id)")
    }

    /// Follow a tag.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Request for `Status`.
    public static func followTag(id: String) -> Request<Tag> {
        return Request<Tag>(path: "/api/v1/tags/\(id)/follow")
    }

    /// Unfollow a tag.
    ///
    /// - Parameter id: The status id.
    /// - Returns: Request for `Status`.
    public static func unfollowTag(id: String) -> Request<Tag> {
        return Request<Tag>(path: "/api/v1/tags/\(id)/unfollow")
    }


}
