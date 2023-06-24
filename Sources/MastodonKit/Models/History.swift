//
//  History.swift
//  MastodonKit
//
//  Created by Taylor Lineman on 6/23/23.
//

public struct History: Codable, Hashable {
    /// UNIX timestamp on midnight of the given day.
    public let day: String
    /// The counted usage of the tag within that day.
    public let uses: String
    ///The total of accounts using the tag within that day.
    public let accounts: String
}
