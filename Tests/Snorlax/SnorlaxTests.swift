import XCTest
import Snorlax
import Foundation

#if !SWIFT_PACKAGE
    import Nimble
#endif

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

    #if SWIFT_PACKAGE

    func testRest() {
        let start = NSDate()
        rest()
        let end = NSDate()
        let duration = end.timeIntervalSinceDate(start)
        XCTAssertGreaterThanOrEqual(duration, 0)
        XCTAssertLessThan(duration, 2)
    }

    #else

    // Xcode Only: SPM doesn't seem to support building testDependencies
    //             and PromiseKit doesn't support SPM.

    func testRest() {
        let start = NSDate()
        rest()
        let end = NSDate()
        let duration = end.timeIntervalSinceDate(start)
        expect(duration) >= 0
        expect(duration) < 2
    }
    #endif
}