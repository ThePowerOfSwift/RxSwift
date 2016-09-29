import Foundation

public func example(_ rxoperator: String, action: () -> ()) {
    print("\n---Example of:", rxoperator, "---")
    action()
}
