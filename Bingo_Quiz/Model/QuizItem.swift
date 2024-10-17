import SwiftUI

struct QuizItem: Codable, Identifiable, Equatable {
  let id: Int
  let answer: String
}

extension QuizItem: Transferable {
  static var transferRepresentation: some TransferRepresentation {
    CodableRepresentation(for: QuizItem.self, contentType: .data)
  }
}
