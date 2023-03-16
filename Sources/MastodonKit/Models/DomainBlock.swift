//
//  DomainBlock.swift
//  
//
//  Created by Taylor Lineman on 3/16/23.
//

import Foundation

public struct DomainBlock: Codable, Hashable {
    public enum BlockSeverity: String, Codable {
        case silence
        case suspend
    }
    
    /// The domain which is blocked. This may be obfuscated or partially censored.
    public let domain: String
    /// The SHA256 hash digest of the domain string.
    public let digest: String
    /// The level to which the domain is blocked.
    public let severity: BlockSeverity
    /// An optional reason for the domain block.
    public let comment: String?
}
