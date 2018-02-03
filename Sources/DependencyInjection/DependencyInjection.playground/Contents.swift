
import UIKit

/* 1. Initializer Injection (DI through an initializer)  */

protocol Serializer {
    func serialize(_ data: Data)
}

struct DataSerializer: Serializer {
    init() { }
    func serialize(_ data: Data) { }
}

struct DataManager {
    private let serializer: Serializer
    
    init(with serializer: Serializer) {
        self.serializer = serializer
    }
}

let serializer = DataSerializer()
let dataManager = DataManager(with: serializer)


/* 2. Method Injection (dependency injection in methods)  */

extension DataManager {
    func serialize(data: Data, with serializer: Serializer) {
        serializer.serialize(data)
    }
}


/* 3. Property Injection (DI using properties)  */

protocol HTTPClient { }

class NetworkClient: HTTPClient {}

final class StoreCoordinator {
    var httpClient: HTTPClient?
    
    init() { }
}

let httpClient = NetworkClient()
let storeCoordinator = StoreCoordinator()
storeCoordinator.httpClient = httpClient

/* Additional case: DI with ViewControllers */

// Someething we want to inject:
struct Data { }

// Generally the Property Injection is not a good idea for viewControllers
// viewController becomes a mess, hard to test and maintain. So we can use an initializer instead:

class ViewController: UIViewController {
    private let data: Data
    
    init(with data: Data) {
        self.data = data
        super.init(nibName: "ViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
}

let data = Data()
let viewController = ViewController(with: data)

