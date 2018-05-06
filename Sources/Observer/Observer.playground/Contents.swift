
import Foundation

/* I. KVO & Objective-C runtime */

// An object that will be observed

// note: @objcMembers marks every property as @objc
@objcMembers
class KeyValueObservableUser: NSObject {
    
    // note: Objective-C's dynamic dispatch system will be used
    // KVO-enabled properties must be @objc dynamic
    dynamic var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

// tests:

let user: KeyValueObservableUser = .init("Michael Keaton")

var observation: NSKeyValueObservation? = user
    .observe(\KeyValueObservableUser.name, options: [.old, .new]) { (user, change) in
        if change.newValue == change.oldValue {
            print("Name did not change.")
        } else {
            print("Name changed to \(change.newValue!)")
        }
}

user.name = "Ben Waffleck"
user.name = "Ben Waffleck"
user.name = "Clint Eastwood"

observation?.invalidate()

user.name = "Kevin Bacon"

print("\n\n\n")


/* II. Custom Observable Type */

typealias Handler<T, U> = (T, U) -> Void



struct ObservableOptions: OptionSet { // similar to KVO's NSKeyValueObservingOptions
    
    static let initial = ObservableOptions(rawValue: 1 << 0)
    static let old = ObservableOptions(rawValue: 1 << 1)
    static let new = ObservableOptions(rawValue: 1 << 2)
    
    var rawValue: Int
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

class Observable<T> {
    
    var value: T {
        didSet {
            removeNilObserverCallbacks()
            notifyCallbacks(value: oldValue, option: .old)
            notifyCallbacks(value: value, option: .new)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: - Observer
    
    func add(observer: AnyObject, removeIfExists: Bool = true, options: [ObservableOptions] = [.new], _ closure: @escaping Handler<T, ObservableOptions>) {
        if removeIfExists {
            remove(observer: observer)
        }
        let callback = Callback(observer: observer, options: options, closure: closure)
        callbacks.append(callback)
        
        if options.contains(.initial) {
            closure(value, .initial)
        }
    }
    
    func remove(observer: AnyObject) {
        callbacks = callbacks.filter { $0.observer !== observer }
    }
    
    // MARK: - Callbacks
    
    private var callbacks = [Callback]()
    
    private class Callback {
        weak var observer: AnyObject?
        let options: [ObservableOptions]
        let closure: Handler<T, ObservableOptions>
        
        init(observer: AnyObject, options: [ObservableOptions], closure: @escaping Handler<T, ObservableOptions>) {
            self.observer = observer
            self.options = options
            self.closure = closure
        }
    }
    
    private func removeNilObserverCallbacks() {
        callbacks = callbacks.filter { $0.observer != nil }
    }
    
    private func notifyCallbacks(value: T, option: ObservableOptions) {
        let callbacksToNotify = callbacks.filter {
            $0.options.contains(option)
        }
        callbacksToNotify.forEach { $0.closure(value, option) }
    }
}

// tests:

class User {
    let name: Observable<String>
    init(_ name: String) {
        self.name = Observable<String>(name)
    }
}

class Observer { }

let user2: User = .init("Michael Keaton")

var observer: Observer? = Observer()

user2.name.add(observer: observer!, options: [.new]) { name, change in
    if change == .new {
        print("Name changed to \(name)")
    }
}

user2.name.value = "Don Cheadle"
user2.name.value = "Ron Swanson"

observer = nil

user2.name.value = "Ben Waffleck"

