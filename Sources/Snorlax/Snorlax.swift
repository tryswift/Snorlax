import Foundation

/// Sleeps for a random time interval
public func rest() {
    let interval = NSTimeInterval(random() % 2)
    NSThread.sleepForTimeInterval(interval)
}
