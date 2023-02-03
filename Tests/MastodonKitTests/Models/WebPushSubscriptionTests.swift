//
//  File.swift
//  
//
//  Created by Zachary Lineman on 2/2/23.
//

import XCTest
@testable import MastodonKit

class WebPushSubscriptionTests: XCTestCase {
    func testWebPushSubscriptionsFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/WebPushSubscription.json")
        let parsed = try? WebPushSubscription.decode(data: fixture)

        print("parsed \(parsed)")
        XCTAssertNotNil(parsed)
        XCTAssertEqual(parsed?.id, 328183)
        XCTAssertEqual(parsed?.endpoint, "https://yourdomain.example/listener")
        XCTAssertEqual(parsed?.alerts.follow, true)
        XCTAssertEqual(parsed?.alerts.favourite, true)
        XCTAssertEqual(parsed?.alerts.reblog, true)
        XCTAssertEqual(parsed?.alerts.mention, true)
        XCTAssertEqual(parsed?.alerts.poll, true)
        XCTAssertEqual(parsed?.server_key, "BCk-QqERU0q-CfYZjcuB6lnyyOYfJ2AifKqfeGIm7Z-HiTU5T9eTG5GxVA0_OH5mMlI4UkkDTpaZwozy0TzdZ2M=")

    }
}
