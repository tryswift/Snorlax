import XCTest
import Snorlax

class SnorlaxTests: XCTestCase {
    func testRest() {
        let expectation = expectationWithDescription("Resting")
        dispatch_async(dispatch_get_main_queue()) {
            rest()
            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(5, handler: nil)
    }
}
