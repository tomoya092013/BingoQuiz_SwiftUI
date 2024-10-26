import SwiftUI

struct VibrationObject: View {
  
  @State var animate = false
  
  var body: some View {
    let itemSize: CGFloat = 80
    let columns = Array(repeating: GridItem(spacing: 1), count: 3)
    LazyVGrid(columns: columns, spacing: 1) {
      ForEach(ColorList, id: \.self) { color in
        Rectangle()
          .fill(LinearGradient(
            gradient: Gradient(colors: [color.opacity(0.8), color.opacity(0.5)]),
            startPoint: .top,
            endPoint: .bottom
          ))
          .frame(width: itemSize, height: itemSize)
          .cornerRadius(10)
          .rotationEffect(.degrees(animate ? -3 : 3),anchor: .center)
          .scaleEffect(animate ? 0.9 : 1.0)
          .onAppear {
            withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: true)) {
              animate.toggle()
            }
          }
      }
    }
    .frame(width: 200, height: 300)
  }
}
