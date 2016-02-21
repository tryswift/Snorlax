import Foundation

#if SWIFT_PACKAGE
    /// Sleeps for a random time interval
    public func rest() {
        let interval = NSTimeInterval(random() % 2)
        NSThread.sleepForTimeInterval(interval)
    }
#else
    import PromiseKit

    /// Sleeps for a random time interval
    public func rest() -> Promise<NSTimeInterval> {
        let interval = NSTimeInterval(random() % 2)
        NSThread.sleepForTimeInterval(interval)
        return Promise { fulfill, _ in fulfill(interval) }
    }
#endif
