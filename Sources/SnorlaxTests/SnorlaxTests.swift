import XCTest
import Snorlax
import Foundation

#if SWIFT_PACKAGE
    class SnorlaxTests: XCTestCase, XCTestCaseProvider {
        var allTests: [(String, () throws -> Void)] {
            return [
                ("testRest", testRest),
            ]
        }

        func testRest() {
            let start = NSDate()
            rest()
            let end = NSDate()
            let duration = end.timeIntervalSinceDate(start)
            XCTAssertGreaterThanOrEqual(duration, 0)
            XCTAssertLessThan(duration, 2)
        }
    }
#else
    class SnorlaxTests: XCTestCase {
        func testRest() {
            let start = NSDate()
            rest()
            let end = NSDate()
            let duration = end.timeIntervalSinceDate(start)
            XCTAssertGreaterThanOrEqual(duration, 0)
            XCTAssertLessThan(duration, 2)
        }
    }
#endif