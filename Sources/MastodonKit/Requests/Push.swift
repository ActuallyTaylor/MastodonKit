//
//  Push.swift
//  
//
//  Created by Zachary Lineman on 2/2/23.
//

import Foundation

/// `Push` requests.
public enum Push {
    public enum PushPolicy: String {
        case all
        case followed
        case follower
        case none
    }
    
    /// Add a Web Push API subscription to receive notifications. Each access token can have one push subscription. If you create a new subscription, the old subscription is deleted.
    ///
    /// - Parameters:
    ///   - endpoint: .Your APNS server's endpoint
    ///   - p256dh: User agent public key. Base64 encoded string of a public key from a ECDH keypair using the prime256v1 curve.
    ///   - authKey: Auth secret. Base64 encoded string of 16 bytes of random data.
    ///   - mention: Receive mention notifications? Defaults to false.
    ///   - status: Receive status notifications? Defaults to false.
    ///   - reblog: Receive reblog notifications? Defaults to false.
    ///   - follow: Receive follow notifications? Defaults to false.
    ///   - followRequest: Receive follow requests notifications? Defaults to false.
    ///   - favorite: Receive favorite notifications? Defaults to false.
    ///   - poll: Receive poll notifications? Defaults to false.
    ///   - update: Receive update notifications? Defaults to false.
    ///   - admin_sign_up: Receive admin sign up notifications? Defaults to false.
    ///   - admin_report: Receive admin report notifications? Defaults to false.
    ///   - policy: Specify whether to receive push notifications from all, followed, follower, or none users.
    /// - Returns: Request for `WebPushSubscription`.
    public static func addSubscription(endpoint: String, p256dh: String, authKey: String, mention: Bool?, status: Bool?, reblog: Bool?, follow: Bool?, followRequest: Bool?, favorite: Bool?, poll: Bool?, update: Bool?, admin_sign_up: Bool?, admin_report: Bool?, policy: PushPolicy) -> Request<WebPushSubscription> {
        let parameters = [
            Parameter(name: "subscription[endpoint]", value: endpoint),
            Parameter(name: "subscription[keys][p256dh]", value: p256dh),
            Parameter(name: "subscription[keys][auth]", value: authKey),
            Parameter(name: "data[alerts][mention]", value: mention.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][status]", value: status.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][reblog]", value: reblog.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][follow]", value: follow.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][follow_request]", value: followRequest.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][favourite]", value: favorite.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][poll]", value: poll.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][update]", value: update.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][admin.sign_up]", value: admin_sign_up.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][admin.report]", value: admin_report.flatMap(trueOrNil)),
            Parameter(name: "policy", value: policy.rawValue),
        ]
        let method = HTTPMethod.post(.parameters(parameters))

        return Request<WebPushSubscription>(path: "/api/v1/push/subscription", method: method)
    }

    /// View the PushSubscription currently associated with this access token.
    ///
    /// - Returns: Request for `WebPushSubscription`
    public static func getSubscription() -> Request<WebPushSubscription> {
        return Request<WebPushSubscription>(path: "/api/v1/push/subscription")
    }

    /// Updates the current push subscription. Only the data part can be updated. To change fundamentals, a new subscription must be created instead.
    ///
    /// - Parameters:
    ///   - mention: Receive mention notifications? Defaults to false.
    ///   - status: Receive status notifications? Defaults to false.
    ///   - reblog: Receive reblog notifications? Defaults to false.
    ///   - follow: Receive follow notifications? Defaults to false.
    ///   - followRequest: Receive follow requests notifications? Defaults to false.
    ///   - favorite: Receive favorite notifications? Defaults to false.
    ///   - poll: Receive poll notifications? Defaults to false.
    ///   - update: Receive update notifications? Defaults to false.
    ///   - admin_sign_up: Receive admin sign up notifications? Defaults to false.
    ///   - admin_report: Receive admin report notifications? Defaults to false.
    ///   - policy: Specify whether to receive push notifications from all, followed, follower, or none users.
    /// - Returns: Request for `WebPushSubscription`.
    public static func updateSubscription(mention: Bool?, status: Bool?, reblog: Bool?, follow: Bool?, followRequest: Bool?, favorite: Bool?, poll: Bool?, update: Bool?, admin_sign_up: Bool?, admin_report: Bool?, policy: PushPolicy) -> Request<WebPushSubscription> {
        let parameters = [
            Parameter(name: "data[alerts][mention]", value: mention.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][status]", value: status.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][reblog]", value: reblog.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][follow]", value: follow.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][follow_request]", value: followRequest.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][favourite]", value: favorite.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][poll]", value: poll.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][update]", value: update.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][admin.sign_up]", value: admin_sign_up.flatMap(trueOrNil)),
            Parameter(name: "data[alerts][admin.report]", value: admin_report.flatMap(trueOrNil)),
            Parameter(name: "policy", value: policy.rawValue),
        ]
        let method = HTTPMethod.put(.parameters(parameters))

        return Request<WebPushSubscription>(path: "/api/v1/push/subscription", method: method)
    }
    
    /// Removes the current Web Push API subscription.
    /// 
    /// - Returns: A request for `Empty`
    public static func deleteSubscription() -> Request<Empty> {
        return Request<Empty>(path: "/api/v1/push/subscription", method: HTTPMethod.delete(.empty))
    }

}
