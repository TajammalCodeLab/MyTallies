import Foundation

@Observable
class Router {
    var tallyName: String?
    init(tallyName: String? = nil) {
        self.tallyName = tallyName
    }
}