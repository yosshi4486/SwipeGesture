import XCTest
@testable import SwipeGesture

final class SwipeGestureTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwipeGesture().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
