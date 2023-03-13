//
//  UserListAppUITestsLaunchTests.swift
//  UserListAppUITests
//
//  Created by Lesly Dahian Higuera Martínez on 11/03/23.
//

import XCTest

final class UserListAppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()



        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
