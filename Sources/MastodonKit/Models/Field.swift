//
//  Field.swift
//  
//
//  Created by Zachary Lineman on 1/18/23.
//

import Foundation

public struct Field: Codable, Hashable {
    /// The key of a given field’s key-value pair.
    public let name: String
    /// The value associated with the name key.
    public let value: String
    /// Timestamp of when the server verified a URL value for a rel=“me” link.
    public let verifiedAt: Date?

    private enum CodingKeys: String, CodingKey {
        case name
        case value
        case verifiedAt = "verified_at"
    }
}
