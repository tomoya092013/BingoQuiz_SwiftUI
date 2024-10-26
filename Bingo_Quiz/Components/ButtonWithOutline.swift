import SwiftUI

struct ButtonWithOutline: View {
  var text: String
  var width: CGFloat
  var height: CGFloat
  var backgroundColor: Color
  var borderColor: Color
  var fontSize: Font
  
  var body: some View {
    RoundedRectangle(cornerRadius: 10)
      .stroke(borderColor, lineWidth: 3)
      .background(RoundedRectangle(cornerRadius: 10).fill(backgroundColor))
      .frame(width: width, height: height)
      .overlay(
        Text(text)
          .font(fontSize)
          .fontWeight(.black)
          .foregroundColor(borderColor)
      )
  }
}

