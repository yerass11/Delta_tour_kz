import Foundation

enum ButtonIcon {
    case systemName(String)
    case customImageName(String)
    
    var systemName: String? {
        if case .systemName(let name) = self {
            return name
        }
        return nil
    }
    
    var customImageName: String? {
        if case .customImageName(let name) = self {
            return name
        }
        return nil
    }
}
