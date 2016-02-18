import Foundation

/// Sleeps for a random time interval
public func rest() {
    NSThread.sleepForTimeInterval(NSTimeInterval(random() % 2))
}
