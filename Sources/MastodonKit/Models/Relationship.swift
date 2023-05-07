//
//  Relationship.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Relationship: Codable, Hashable {
    /// Target account id.
    public let id: String
    /// Whether the user is currently following the account.
    public let following: Bool
    /// Whether the user is currently being followed by the account.
    public let followedBy: Bool
    /// Whether the user is currently blocking the account.
    public let blocking: Bool
    /// Whether the user is currently muting the account.
    public let muting: Bool
    /// Whether the user is also muting notifications
    public let mutingNotifications: Bool
    /// Whether the user has requested to follow the account.
    public let requested: Bool
    /// Whether the user is currently blocking the user's domain.
    public let domainBlocking: Bool
    /// Are you receiving this user’s boosts in your home timeline?
    public let showingReblogs: Bool
    /// Have you enabled notifications for this user?
    public let notifying: Bool
    /// Which languages are you following from this user?
    public let languages: [String]?
    /// Is this user blocking you?
    public let blockedBy: Bool
    /// Are you featuring this user on your profile?
    public let endorsed: Bool
    /// This user’s profile bio
    public let note: String

    private enum CodingKeys: String, CodingKey {
        case id
        case following
        case followedBy = "followed_by"
        case blocking
        case muting
        case mutingNotifications = "muting_notifications"
        case requested
        case domainBlocking = "domain_blocking"
        case showingReblogs = "showing_reblogs"
        case notifying
        case languages
        case blockedBy = "blocked_by"
        case endorsed
        case note
    }
}
