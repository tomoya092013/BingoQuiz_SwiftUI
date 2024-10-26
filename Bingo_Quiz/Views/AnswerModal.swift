import SwiftUI

struct AnswerModal: View {
  @Environment(\.dismiss) private var dismiss
  var selectedId: Int
  
  var body: some View {
    VStack {
      Text("選択したID: \(selectedId)")
        .font(.title)
        .padding()
      Button("閉じる") {
        dismiss()
      }
    }
    .navigationTitle("モーダル")
    .navigationBarTitleDisplayMode(.inline)
  }
}


#Preview {
  AnswerModal(selectedId: 6)
}
