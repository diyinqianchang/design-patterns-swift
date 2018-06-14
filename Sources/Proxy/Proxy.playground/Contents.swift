
import UIKit

enum InAppProduct {
    case tutorialOne, tutorialTwo, tutorialThree, tutorialFour, tutorialFive, bonusContent
    static let all: [InAppProduct] = [.tutorialOne, .tutorialTwo, .tutorialThree, .tutorialFour, .tutorialFive, .bonusContent]
}

extension InAppProduct: CustomStringConvertible {
    var description: String {
        switch self {
        case .tutorialOne:   return "Free tutorial."
        case .tutorialTwo:   return "Tutorial 2: Beginner."
        case .tutorialThree: return "Tutorial 3: Advanced."
        case .tutorialFour:  return "Tutorial 3: More Depth."
        case .tutorialFive:  return "Tutorial 4: Pro."
        case .bonusContent:  return "Exclusive additional contents."
        }
    }
}

struct User {
    let name: String
    let token: String
}

protocol AuthStorage {
    func isAuthorised(token: String) -> Bool
}

/* Obviously not an apropriate storage for sensitive data,
   do not use something like this :)
 */
final class PurchasedStorage: AuthStorage {
    private var purchased: [String: Bool] {
        return ["000000000": false, "000000001": false, "000000002": true, "000000003": true]
    }
    
    func isAuthorised(token: String) -> Bool {
        return purchased[token] ?? false
    }
}

protocol PurchaseServiceProtocol {
    func displayContents()
}

final class RealPurchaseService: PurchaseServiceProtocol {
    func displayContents() {
        InAppProduct.all.forEach { print($0.description) }
    }
}

final class ProxyPurchaseService: PurchaseServiceProtocol {
    
    private let realPurchaseService: PurchaseServiceProtocol
    private let authStorage: AuthStorage
    private var authToken: String
    
    init(authToken: String = String(), realPurchaseService: PurchaseServiceProtocol, authStorage: AuthStorage) {
        self.authToken = authToken
        self.realPurchaseService = realPurchaseService
        self.authStorage = authStorage
    }
    
    func authorize(withToken authToken: String) {
        self.authToken = authToken
    }
    
    func displayContents() {
        guard authStorage.isAuthorised(token: authToken) else {
            print(InAppProduct.tutorialOne.description + "\n")
            return
        }
        realPurchaseService.displayContents()
    }
}

let freeUser = User(name: "Volodymyr", token: "000000001")
let paidUser = User(name: "Michael", token: "000000003")

let authStorage = PurchasedStorage()
let unprotectedPurchaseService = RealPurchaseService()
let protectedPurchaseService = ProxyPurchaseService(realPurchaseService: unprotectedPurchaseService, authStorage: authStorage)

protectedPurchaseService.authorize(withToken: freeUser.token)
protectedPurchaseService.displayContents()

protectedPurchaseService.authorize(withToken: paidUser.token)
protectedPurchaseService.displayContents()
