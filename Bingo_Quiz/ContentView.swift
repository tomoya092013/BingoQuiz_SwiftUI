import SwiftUI

struct ContentView: View {
  @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .orange, .indigo, .cyan, .brown, .mint]
  @State private var draggingItem: Color?
  
  var body: some View {
    NavigationStack {
      GeometryReader{ geometry in
        let itemSize = max((geometry.size.width - 40) / 3, 0)
        let columns = Array(repeating: GridItem(spacing: 10), count: 3)
        LazyVGrid(columns: columns, spacing: 10, content: {
          ForEach(colors, id: \.self) { color in
            RoundedRectangle(cornerRadius: 10)
              .fill(color)
              .frame(width: itemSize, height: itemSize)
              .draggable(color) {
                RoundedRectangle(cornerRadius: 10)
                  .fill(.ultraThinMaterial)
                  .frame(width: itemSize, height: itemSize)
                  .onAppear{
                    draggingItem = color
                  }
              }
              .dropDestination(for: Color.self) { items, location in
                draggingItem = nil
                return false
              } isTargeted: { status in
                if let draggingItem, status, draggingItem != color {
                  if let sourceIndex = colors.firstIndex(of:draggingItem),
                     let destinationIndex = colors.firstIndex(of: color){
                    withAnimation(.bouncy) {
                      let sourceItem = colors.remove(at: sourceIndex)
                      colors.insert(sourceItem, at:destinationIndex)
                    }
                  }
                }
              }
          }
        })
      }
      .padding(20)
      .navigationTitle("ドラッグ&ドロップ")
    }
  }
}

#Preview {
  ContentView()
}
