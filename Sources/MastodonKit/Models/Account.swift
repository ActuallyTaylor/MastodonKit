//
//  Account.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Account: Codable, Hashable {
    /// The ID of the account.
    public let id: String
    /// The username of the account.
    public let username: String
    /// Equals username for local users, includes @domain for remote ones.
    public let acct: String
    /// The account's display name.
    public let displayName: String
    /// Biography of user.
    public let note: String
    /// URL of the user's profile page (can be remote).
    public let url: String
    /// URL to the avatar image.
    public let avatar: String
    /// URL to the avatar static image
    public let avatarStatic: String
    /// URL to the header image.
    public let header: String
    /// URL to the header static image
    public let headerStatic: String
    /// Boolean for when the account cannot be followed without waiting for approval first.
    public let locked: Bool
    /// The time the account was created.
    public let createdAt: Date
    /// The number of followers for the account.
    public let followersCount: Int
    /// The number of accounts the given account is following.
    public let followingCount: Int
    /// The number of statuses the account has made.
    public let statusesCount: Int
    /// Indicates that the account may perform automated actions, may not be monitored, or identifies as a robot.
    public let bot: Bool
    /// Indicates that the account represents a Group actor.
    public let group: Bool
    /// Whether the account has opted into discovery features such as the profile directory.
    public let discoverable: Bool?
    /// Whether the local user has opted out of being indexed by search engines.
    public let noindex: Bool?
    /// An extra attribute returned only when an account is suspended.
    public let suspended: Bool?
    /// An extra attribute returned only when an account is silenced. If true, indicates that the account should be hidden behind a warning screen.
    public let limited: Bool?
    /// When the most recent status was posted.
    public let lastStatusAt: Data?
    
    /// An array of `Field`
    public var fields: [Field] {
        return _fields ?? []
    }

    private let _fields: [Field]?

    /// An array of `Emoji`.
    public var emojis: [Emoji] {
        return _emojis ?? []
    }

    /// Real storage of emojis.
    ///
    /// According to the [documentation](https://docs.joinmastodon.org/api/entities/#account),
    /// property emoji is added in 2.4.0, and it is non-optional. But for compibility with older version instance, we
    /// use `[Emoji]?` as storage and use `[Emoji]` as public API.
    private let _emojis: [Emoji]?

    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case acct
        case displayName = "display_name"
        case note
        case url
        case avatar
        case avatarStatic = "avatar_static"
        case header
        case headerStatic = "header_static"
        case locked
        case createdAt = "created_at"
        case followersCount = "followers_count"
        case followingCount = "following_count"
        case statusesCount = "statuses_count"
        case _emojis = "emojis"
        case _fields = "fields"
        case bot
        case group
        case discoverable
        case noindex
        case suspended
        case limited
        case lastStatusAt
    }
}
