//
//  Instance.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Instance: Codable, Hashable {
    public struct InstanceUsage: Codable, Hashable {
        public struct UserInstanceUsage: Codable, Hashable {
            /// The number of active users in the past 4 weeks.
            public let activeMonth: Int
            
            private enum CodingKeys: String, CodingKey {
                case activeMonth = "active_month"
            }
        }
        
        /// Usage data related to users on this instance.
        public let users: UserInstanceUsage
    }
    
    public struct InstanceThumbnail: Codable, Hashable {
        public struct InstanceThumbnailVersions: Codable, Hashable {
            /// The URL for the thumbnail image at 1x resolution.
            public let oneX: String?
            /// The URL for the thumbnail image at 2x resolution.
            public let twoX: String?
            
            private enum CodingKeys: String, CodingKey {
                case oneX = "@1x"
                case twoX = "@2x"

            }
        }
        
        /// The URL for the thumbnail image.
        public let url: String
        /// A hash computed by the BlurHash algorithm, for generating colorful preview thumbnails when media has not been downloaded yet.
        public let blurhash: String
        /// Links to scaled resolution images, for high DPI screens.
        public let versions: InstanceThumbnailVersions?
    }
    
    public struct InstanceConfiguration: Codable, Hashable {
        public struct InstanceConfigurationURLs: Codable, Hashable {
            /// The Websockets URL for connecting to the streaming API.
            public let streaming: String
            public let status: String?
            
            private enum CodingKeys: String, CodingKey {
                case streaming = "streaming"
                case status
            }
        }
    
        public struct InstanceConfigurationAccounts: Codable, Hashable {
            /// The maximum number of featured tags allowed for each account.
            public let maxFeaturedTags: Int
            
            private enum CodingKeys: String, CodingKey {
                case maxFeaturedTags = "max_featured_tags"
            }
        }
        
        public struct InstanceConfigurationStatuses: Codable, Hashable {
            /// The maximum number of allowed characters per status.
            public let maxCharacters: Int
            /// The maximum number of media attachments that can be added to a status.
            public let maxMediaAttachments: Int
            /// Each URL in a status will be assumed to be exactly this many characters.
            public let charactersReservedPerUrl: Int

            private enum CodingKeys: String, CodingKey {
                case maxCharacters = "max_characters"
                case maxMediaAttachments = "max_media_attachments"
                case charactersReservedPerUrl = "characters_reserved_per_url"
            }
        }
        
        public struct InstanceConfigurationMediaAttachments: Codable, Hashable {
            /// Contains MIME types that can be uploaded.
            public let supportedMimeTypes: [String]
            /// The maximum size of any uploaded image, in bytes.
            public let imageSizeLimit: Int
            /// The maximum number of pixels (width times height) for image uploads.
            public let imageMatrixLimit: Int
            /// The maximum size of any uploaded video, in bytes.
            public let videoSizeLimit: Int
            /// The maximum frame rate for any uploaded video.
            public let videoFrameRateLimit: Int
            /// The maximum number of pixels (width times height) for video uploads.
            public let videoMatrixLimit: Int

            private enum CodingKeys: String, CodingKey {
                case supportedMimeTypes = "supported_mime_types"
                case imageSizeLimit = "image_size_limit"
                case imageMatrixLimit = "image_matrix_limit"
                case videoSizeLimit = "video_size_limit"
                case videoFrameRateLimit = "video_frame_rate_limit"
                case videoMatrixLimit = "video_matrix_limit"
            }
        }
        
        public struct InstanceConfigurationPolls: Codable, Hashable {
            /// Each poll is allowed to have up to this many options.
            public let maxOptions: Int
            /// Each poll option is allowed to have this many characters.
            public let maxCharactersPerOption: Int
            /// The shortest allowed poll duration, in seconds.
            public let minExpiration: Int
            /// The longest allowed poll duration, in seconds.
            public let maxExpiration: Int

            private enum CodingKeys: String, CodingKey {
                case maxOptions = "max_options"
                case maxCharactersPerOption = "max_characters_per_option"
                case minExpiration = "min_expiration"
                case maxExpiration = "max_expiration"
            }
        }
        
        public struct InstanceConfigurationTranslation: Codable, Hashable {
            /// Whether the Translations API is available on this instance.
            public let enabled: Bool
        }
        
        /// URLs of interest for clients apps.
        public let urls: InstanceConfigurationURLs
        /// Limits related to accounts.
        public let accounts: InstanceConfigurationAccounts
        /// Limits related to authoring statuses.
        public let statuses: InstanceConfigurationStatuses
        /// Limits related to authoring statuses.
        public let mediaAttachments: InstanceConfigurationMediaAttachments
        /// Limits related to polls.
        public let polls: InstanceConfigurationPolls
        /// Hints related to translation.
        public let translation: InstanceConfigurationTranslation

        private enum CodingKeys: String, CodingKey {
            case urls
            case accounts
            case statuses
            case mediaAttachments = "media_attachments"
            case polls
            case translation
        }
    }
    
    public struct InstanceRegistrations: Codable, Hashable {
        /// Whether registrations are enabled.
        public let enabled: Bool
        /// Whether registrations require moderator approval.
        public let approvalRequired: Bool
        /// A custom message to be shown when registrations are closed.
        public let message: String?
        
        private enum CodingKeys: String, CodingKey {
            case enabled
            case approvalRequired = "approval_required"
            case message
        }
    }
    
    public struct InstanceContact: Codable, Hashable {
        /// An email address that can be messaged regarding inquiries or issues.
        public let email: String
        /// An account that can be contacted natively over the network regarding inquiries or issues.
        public let account: Account
        
    }
    
    /// The domain name of the instance.
    public let domain: String
    /// The title of the website.
    public let title: String
    /// The version of Mastodon installed on the instance.
    public let version: String
    /// The URL for the source code of the software running on this instance, in keeping with AGPL license requirements.
    public let sourceURL: String
    /// A short, plain-text description defined by the admin.
    public let description: String
    /// Usage data for this instance.
    public let usage: InstanceUsage
    /// An image used to represent this instance.
    public let thumbnail: InstanceThumbnail
    /// Primary languages of the website and its staff.
    public let languages: [String]
    /// Configured values and limits for this website.
    public let configuration: InstanceConfiguration
    /// Information about registering for this website.
    public let registrations: InstanceRegistrations
    /// Hints related to contacting a representative of the website.
    public let contact: InstanceContact
    /// An itemized list of rules for this website
    public let rules: [Rule]
    
    private enum CodingKeys: String, CodingKey {
        case domain
        case title
        case version
        case sourceURL = "source_url"
        case description
        case usage
        case thumbnail
        case languages
        case configuration
        case registrations
        case contact
        case rules
    }
}
