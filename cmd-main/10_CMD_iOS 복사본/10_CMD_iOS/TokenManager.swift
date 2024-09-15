import Foundation

private let key = "TOKEN"

var accessToken: String {
    get {
        UserDefaults.standard.string(forKey: key) ?? ""
    }
    set {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.set(newValue, forKey: key)
    }
}
