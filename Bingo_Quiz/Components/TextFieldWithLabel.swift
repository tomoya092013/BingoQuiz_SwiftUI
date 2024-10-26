import SwiftUI

struct TextFieldWithLabel: View {
  var label: String
  var placeholder : String
  @Binding var text: String
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(label).font(.headline)
      TextField(placeholder, text: $text)
        .padding(.all)
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
        .background(Color.gray.opacity(0.1))
    }
  }
}
