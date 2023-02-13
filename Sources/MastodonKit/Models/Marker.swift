//
//  Marker.swift
//  
//
//  Created by Zachary Lineman on 2/12/23.
//

import Foundation

public struct MarkerPackage: Codable, Hashable {
    public let home: Marker?
    public let notifications: Marker?
}

public struct Marker: Codable, Hashable {
    /// The ID of the most recently viewed entity.
    public let lastReadId: String
    /// An incrementing counter, used for locking to prevent write conflicts.
    public let version: Int
    /// The timestamp of when the marker was set.
    public let updatedAt: Date

    private enum CodingKeys: String, CodingKey {
        case lastReadId = "last_read_id"
        case version
        case updatedAt = "updated_at"
    }
}
