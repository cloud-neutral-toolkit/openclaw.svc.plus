import Foundation

enum AccountAuthStatus: String, Codable {
    case unauthenticated
    case offline
    case authenticated

    var settingsTitle: String {
        switch self {
        case .authenticated:
            "Account"
        case .offline, .unauthenticated:
            "Account Login"
        }
    }

    var settingsSystemImage: String {
        switch self {
        case .authenticated:
            "person.crop.circle.badge.checkmark"
        case .offline, .unauthenticated:
            "person.crop.circle"
        }
    }

    var statusLabel: String {
        switch self {
        case .authenticated:
            "Signed in"
        case .offline:
            "Local mode"
        case .unauthenticated:
            "Not signed in"
        }
    }
}

struct AccountUser: Codable, Equatable, Sendable {
    let id: String
    let displayName: String
    let emailOrAccount: String

    var initials: String {
        let parts = self.displayName
            .split(whereSeparator: \.isWhitespace)
            .prefix(2)
            .compactMap { $0.first }
        let value = String(parts)
        if !value.isEmpty { return value.uppercased() }
        return String(self.emailOrAccount.prefix(2)).uppercased()
    }

    static func mock(from identifier: String) -> AccountUser {
        let trimmed = identifier.trimmingCharacters(in: .whitespacesAndNewlines)
        let nameSource = trimmed.split(separator: "@").first.map(String.init) ?? trimmed
        let collapsed = nameSource
            .replacingOccurrences(of: ".", with: " ")
            .replacingOccurrences(of: "_", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let displayName = collapsed.isEmpty ? "Local Account" : collapsed.capitalized
        return AccountUser(
            id: UUID().uuidString,
            displayName: displayName,
            emailOrAccount: trimmed)
    }
}
