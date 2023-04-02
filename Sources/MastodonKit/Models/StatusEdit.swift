//
//  StatusEdit.swift
//  
//
//  Created by Taylor Lineman on 4/2/23.
//

import Foundation

public struct StatusEdit: Codable, Hashable {
    public struct StatusEditPoll: Codable, Hashable {
        public struct StatusEditPollOption: Codable, Hashable {
            /// The text for a poll option.
            public let title: String
        }
        
        /// The poll options at this revision.
        public let options: [StatusEditPollOption]
    }
    
    /// The content of the status at this revision.
    public let content: String
    /// The content of the subject or content warning at this revision.
    public let spoilerText: String
    /// Whether the status was marked sensitive at this revision.
    public let sensitive: Bool
    /// The timestamp of when the revision was published.
    public let createdAt: Date
    /// The account that published this revision.
    public let account: Account
    /// The poll options at this revision.
    public let poll: StatusEditPoll?
    /// The current state of the poll options at this revision. Note that edits changing the poll options will be collapsed together into one edit, since this action resets the poll.
    public let mediaAttachments: [Attachment]
    /// Any custom emoji that are used in the current revision.
    public let emojis: [Emoji]
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case spoilerText = "spoiler_text"
        case sensitive
        case createdAt = "created_at"
        case account
        case poll
        case mediaAttachments = "media_attachments"
        case emojis
    }
}
