//
//  WebPushSubscription.swift
//  
//
//  Created by Zachary Lineman on 2/2/23.
//

import Foundation

public struct WebPushSubscription: Codable, Hashable {
    /// The ID of the Web Push subscription in the database.
    public let id: String
    /// Where push alerts will be sent to.
    public let endpoint: String
    /// The streaming server’s VAPID key.
    public let server_key: String
    /// Which alerts should be delivered to the endpoint.
    public let alerts: Alert
    
    public struct Alert: Codable, Hashable {
        /// Receive a push notification when someone else has mentioned you in a status?
        public let mention: Bool
        ///Receive a push notification when a subscribed account posts a status?
        public let status: Bool
        /// Receive a push notification when a status you created has been boosted by someone else?
        public let reblog: Bool
        /// Receive a push notification when someone has followed you?
        public let follow: Bool
        /// Receive a push notification when someone has requested to followed you?
        public let followRequest: Bool
        /// Receive a push notification when a status you created has been favourited by someone else?
        public let favourite: Bool
        /// Receive a push notification when a poll you voted in or created has ended?
        public let poll: Bool
        /// Receive a push notification when a status you interacted with has been edited?
        public let update: Bool
        /// Receive a push notification when a new user has signed up?
        public let adminSign_up: Bool
        /// Receive a push notification when a new report has been filed?
        public let adminReport: Bool
        
        
        enum CodingKeys: String, CodingKey {
            case mention
            case status
            case reblog
            case follow
            case followRequest
            case favourite
            case poll
            case update
            case adminSign_up = "admin.sign_up"
            case adminReport = "admin.report"
        }
    }
}
