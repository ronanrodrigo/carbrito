import UIKit
import os.log

struct Log {

    static func notLinked(action: String) {
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "NotLinkedAction")
        os_log("%@", log: log, type: .error, action)
    }

    static func initCoder(from: AnyClass) -> String {
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "CoderInit")
        os_log("%@", log: log, type: .error, String(describing: from))
        return "CoderInit: \(String(describing: from))"
    }

}
