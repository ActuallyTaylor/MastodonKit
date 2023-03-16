//
//  InstanceActivity.swift
//  
//
//  Created by Taylor Lineman on 3/16/23.
//

import Foundation

public struct InstanceActivity: Codable, Hashable {
    /// String (UNIX Timestamp). Midnight at the first day of the week.
    public let week: String
    /// String (cast from an integer). The number of Statuses created since the week began.
    public let statuses: String
    /// String (cast from an integer). The number of user logins since the week began.
    public let logins: String
    /// String (cast from an integer). The number of user registrations since the week began.
    public let registrations: String
}
