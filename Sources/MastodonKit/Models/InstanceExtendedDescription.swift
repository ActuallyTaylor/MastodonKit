//
//  InstanceExtendedDescription.swift
//  
//
//  Created by Taylor Lineman on 3/16/23.
//

import Foundation

public struct InstanceExtendedDescription: Codable, Hashable {
    /// A timestamp of when the extended description was last updated.
    public let updatedAt: String
    /// The rendered HTML content of the extended description.
    public let content: String
    
    private enum CodingKeys: String, CodingKey {
        case updatedAt = "updated_at"
        case content
    }
}
