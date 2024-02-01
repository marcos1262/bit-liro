import Foundation

enum LocalizedStrings {
    static let listSceneTitle = localized("listSceneTitle")
    static let detailSceneTitle = localized("detailSceneTitle")
    static let nameTitle = localized("nameTitle")
    static let idTitle = localized("idTitle")
    static let volumeTitle = localized("volumeTitle")
    static let errorMessage = localized("errorMessage")
    static let tryAgain = localized("tryAgain")
}

extension LocalizedStrings {
    private static func localized(_ title: String) -> String {
        NSLocalizedString(title, comment: "")
    }
}
