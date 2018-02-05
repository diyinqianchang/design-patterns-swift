
import UIKit

/* Callback pattern is trivial and widely used in everyday programming */

/* Some examples from everyday usage (URLSession's dataTask and UIViewController's present functions):
 * func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTaks
 * func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil)
 */

// often used for asynchronous functions:

struct API {
    private init() {}

    static func performAsynchronousTask(_ callback: (String) -> Void) {
        print("Performed an async task.")
        // triggering callback (completion handler) in the end and passing a return value
        let result = "DONE!"
        callback(result)
    }
}

API.performAsynchronousTask { result in
    print("Callback! Returned result is: '\(result)'")
}

// Callbacks can be used to wrap a chunck of code:

/* 1. */

// If the a closure passed to a function gets called after the function that it’s passed to then you have an escaping closure.
func main(_ function: @escaping () -> Void) {
    DispatchQueue.main.async {
        function()
    }
}

main {
    // update UI
}

/* 2. */

class Manager {
    private let queue = DispatchQueue(label: "com.zayatsoleh.objectpool.queue")
    
    func performTask() {
        synchronize {
            // task
        }
    }

    private func synchronize(_ function: @escaping () -> Void) {
        queue.sync { function() }
    }
}
