import Foundation

extension String {
    var words: [String] {
        self.lowercased().split(whereSeparator: { !$0.isLetter }).map(String.init)
    }
}
