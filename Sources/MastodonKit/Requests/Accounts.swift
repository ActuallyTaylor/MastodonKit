//
//  Accounts.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

/// `Accounts` requests.
public enum Accounts {
    /// Creates a user and account records. Returns an account access token for the app that initiated the request. The app should save this token for later, and should wait for the user to confirm their account by clicking a link in their email inbox.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Account`.
    public static func register(username: String, email: String, password: String, agreement: Bool, locale: String) -> Request<Empty> {
        let parameters = [
            Parameter(name: "username", value: username),
            Parameter(name: "email", value: email),
            Parameter(name: "password", value: password),
            Parameter(name: "agreement", value: trueOrNil(agreement)),
            Parameter(name: "locale", value: locale)
        ]

        let method = HTTPMethod.post(.parameters(parameters))
        return Request<Empty>(path: "/api/v1/accounts", method: method)
    }

    
    /// Fetches an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Account`.
    public static func account(id: String) -> Request<Account> {
        return Request<Account>(path: "/api/v1/accounts/\(id)")
    }

    /// Gets the current user.
    ///
    /// - Returns: Request for `Account`.
    public static func currentUser() -> Request<Account> {
        return Request<Account>(path: "/api/v1/accounts/verify_credentials")
    }

    /// Updates the current user.
    ///
    /// - Parameters:
    ///   - displayName: The name to display in the user's profile.
    ///   - note: A new biography for the user.
    ///   - avatar: The media attachment to display as the user's avatar.
    ///   - header: The media attachment to display as the user's header image.
    /// - Returns: Request for `Account`.
    public static func updateCurrentUser(displayName: String? = nil,
                                         note: String? = nil,
                                         avatar: MediaAttachment? = nil,
                                         header: MediaAttachment? = nil) -> Request<Account> {
        let parameters = [
            Parameter(name: "display_name", value: displayName),
            Parameter(name: "note", value: note),
            Parameter(name: "avatar", value: avatar?.base64EncondedString),
            Parameter(name: "header", value: header?.base64EncondedString)
        ]

        let method = HTTPMethod.patch(.parameters(parameters))
        return Request<Account>(path: "/api/v1/accounts/update_credentials", method: method)
    }

    /// Gets an account's followers.
    ///
    /// - Parameters:
    ///   - id: The account id.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Account]`.
    public static func followers(id: String, range: RequestRange = .default) -> Request<[Account]> {
        let parameters = range.parameters(limit: between(1, and: 80, default: 40))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Account]>(path: "/api/v1/accounts/\(id)/followers", method: method)
    }

    /// Gets who account is following.
    ///
    /// - Parameters:
    ///   - id: The account id
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Account]`.
    public static func following(id: String, range: RequestRange = .default) -> Request<[Account]> {
        let parameters = range.parameters(limit: between(1, and: 80, default: 40))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Account]>(path: "/api/v1/accounts/\(id)/following", method: method)
    }
    
    /// Gets an account's blocked accounts.
    ///
    /// - Parameters:
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Account]`.
    public static func blocks(range: RequestRange = .default) -> Request<[Account]> {
        let parameters = range.parameters(limit: between(1, and: 80, default: 40))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Account]>(path: "/api/v1/blocks", method: method)
    }

    /// Gets an account's blocked accounts.
    ///
    /// - Parameters:
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Account]`.
    public static func mutes(range: RequestRange = .default) -> Request<[Account]> {
        let parameters = range.parameters(limit: between(1, and: 80, default: 40))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Account]>(path: "/api/v1/mutes", method: method)
    }

    /// Gets an account's statuses.
    ///
    /// - Parameters:
    ///   - id: The account id.
    ///   - mediaOnly: Only return statuses that have media attachments.
    ///   - pinnedOnly: Only return statuses that have been pinned.
    ///   - excludeReplies: Skip statuses that reply to other statuses.
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Status]`.
    public static func statuses(id: String,
                                mediaOnly: Bool? = nil,
                                pinnedOnly: Bool? = nil,
                                excludeReplies: Bool? = nil,
                                range: RequestRange = .default) -> Request<[Status]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, default: 20)) ?? []
        let parameters = rangeParameters + [
            Parameter(name: "only_media", value: mediaOnly.flatMap(trueOrNil)),
            Parameter(name: "pinned", value: pinnedOnly.flatMap(trueOrNil)),
            Parameter(name: "exclude_replies", value: excludeReplies.flatMap(trueOrNil))
        ]

        let method = HTTPMethod.get(.parameters(parameters))
        return Request<[Status]>(path: "/api/v1/accounts/\(id)/statuses", method: method)
    }

    /// Follows an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Account`.
    public static func follow(id: String) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/follow", method: .post(.empty))
    }

    /// Unfollow an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Account`.
    public static func unfollow(id: String) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/unfollow", method: .post(.empty))
    }

    /// Follows a remote user:.
    ///
    /// - Parameter uri: The 'username@domain' of the remote user to follow.
    /// - Returns: Request for `Account`.
    public static func remoteFollow(uri: String) -> Request<Account> {
        let parameter = [Parameter(name: "uri", value: uri)]
        let method = HTTPMethod.post(.parameters(parameter))

        return Request<Account>(path: "/api/v1/follows", method: method)
    }

    /// Blocks an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Relationship`.
    public static func block(id: String) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/block", method: .post(.empty))
    }

    /// Unblocks an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Relationship`.
    public static func unblock(id: String) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/unblock", method: .post(.empty))
    }

    /// Mutes an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Relationship`.
    public static func mute(id: String) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/mute", method: .post(.empty))
    }

    /// Unmutes an account.
    ///
    /// - Parameter id: The account id.
    /// - Returns: Request for `Relationship`.
    public static func unmute(id: String) -> Request<Relationship> {
        return Request<Relationship>(path: "/api/v1/accounts/\(id)/unmute", method: .post(.empty))
    }

    /// Gets an account's relationships.
    ///
    /// - Parameter ids: The account's ids.
    /// - Returns: Request for `[Relationship]`.
    public static func relationships(ids: [String]) -> Request<[Relationship]> {
        let parameters = ids.map(toArrayOfParameters(withName: "id"))
        let method = HTTPMethod.get(.parameters(parameters))

        return Request<[Relationship]>(path: "/api/v1/accounts/relationships", method: method)
    }

    /// Searches for accounts.
    ///
    /// - Parameters:
    ///   - query: What to search for.
    ///   - limit: Maximum number of matching accounts to return (default: 40).
    ///   - following: Limit the search to following (default: false).
    /// - Returns: Request for `[Account]`.
    public static func search(query: String, limit: Int? = nil, following: Bool? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(name: "q", value: query),
            Parameter(name: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(name: "following", value: following.flatMap(trueOrNil))
        ]

        let method = HTTPMethod.get(.parameters(parameters))
        return Request<[Account]>(path: "/api/v1/accounts/search", method: method)
    }
    
    /// Quickly lookup a username to see if it is available, skipping WebFinger resolution.
    ///
    /// - Parameter acct: The acct uri of the account
    /// - Returns: Request for `Account`.
    public static func lookup(acct: String) -> Request<Account> {
        let parameter = [Parameter(name: "acct", value: acct)]
        let method = HTTPMethod.get(.parameters(parameter))

        return Request<Account>(path: "/api/v1/accounts/lookup", method: method)
    }

    ///
    /// - Parameters:
    ///   - query: What to search for.
    ///   - limit: Maximum number of matching accounts to return (default: 40).
    ///   - following: Limit the search to following (default: false).
    /// - Returns: Request for `[Account]`.
    public static func followedTags(range: RequestRange = .default, limit: Int = 100) -> Request<[Tag]> {
        let rangeParameters = range.parameters(limit: between(1, and: 200, default: limit)) ?? []
        let method = HTTPMethod.get(.parameters(rangeParameters))

        return Request<[Tag]>(path: "/api/v1/followed_tags", method: method)
    }

}
