import XCTest
import Snorlax
import Foundation

#if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
    public protocol XCTestCaseProvider {
        var allTests: [(String, () throws -> Void)] { get }
    }
#endif

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
