import SwiftUI

struct BingoSheetItem: Codable, Identifiable, Equatable {
  let id: Int
  let answer: String
}

extension BingoSheetItem: Transferable {
  static var transferRepresentation: some TransferRepresentation {
    CodableRepresentation(for: BingoSheetItem.self, contentType: .data)
  }
}
