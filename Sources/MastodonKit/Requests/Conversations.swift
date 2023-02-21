//
//  Conversations.swift
//  
//
//  Created by Zachary Lineman on 2/20/23.
//

import Foundation

public enum Conversations {
    /// Retrieves all of your conversations.
    ///
    /// - Parameters:
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Conversation]`.
    public static func conversations(range: RequestRange = .default) -> Request<[Conversation]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, default: 20)) ?? []
        let method = HTTPMethod.get(.parameters(rangeParameters))

        return Request<[Conversation]>(path: "/api/v1/conversations/", method: method)
    }
    
    /// Delete a conversation
    ///
    /// - Parameters:
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Conversation]`.
    public static func delete(id: String) -> Request<Empty> {
        let method = HTTPMethod.delete(.empty)

        return Request<Empty>(path: "/api/v1/conversations/\(id)", method: method)
    }

    /// Delete a conversation
    ///
    /// - Parameters:
    ///   - range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Conversation]`.
    public static func read(id: String) -> Request<Conversation> {
        let method = HTTPMethod.post(.empty)

        return Request<Conversation>(path: "/api/v1/conversations/\(id)/read", method: method)
    }
}
