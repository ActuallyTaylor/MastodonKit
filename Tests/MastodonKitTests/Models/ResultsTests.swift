//
//  ResultsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/15/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class ResultsTests: XCTestCase {
    func testResultsFromValidJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Results.json")
        let results = try? Results.decode(data: fixture)

        XCTAssertEqual(results?.accounts.count, 1)
        XCTAssertEqual(results?.statuses.count, 1)
        XCTAssertEqual((results?.hashtags)!, [Tag(name: "Test", url: "http://mastodon.example/tags/test", history: [Tag.History(day: "1668556800", uses: "0", accounts: "0  ")], following: false)])
    }

    func testResultsWithInvalidData() {
        let results = try? Results.decode(data: Data())

        XCTAssertNil(results)
    }
}
