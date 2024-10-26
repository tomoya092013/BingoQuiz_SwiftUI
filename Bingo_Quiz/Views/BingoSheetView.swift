import SwiftUI

struct BingoSheetView: View {
  @State private var sampleBingoSheetItemList: [BingoSheetItem] = [
    .init(id: 1, answer: "A"),
    .init(id: 2, answer: "B"),
    .init(id: 3, answer: "B"),
    .init(id: 4, answer: "A"),
    .init(id: 5, answer: "B"),
    .init(id: 6, answer: "C"),
    .init(id: 7, answer: "C"),
    .init(id: 8, answer: "C"),
    .init(id: 9, answer: "B"),
  ]
  
  @State private var draggingBingoSheetItem: BingoSheetItem?
  @State private var selectedItem: BingoSheetItem? = nil
  
  var body: some View {
    NavigationStack {
      GeometryReader{ geometry in
        let itemSize = max((geometry.size.width - 40) / 3, 0)
        let columns = Array(repeating: GridItem(spacing: 20), count: 3)
        LazyVGrid(columns: columns, spacing: 20, content: {
          ForEach(sampleBingoSheetItemList, id: \.self.id) { sampleBingoSheetItem in
            let color = ColorList[sampleBingoSheetItem.id - 1]
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color.black, lineWidth: 1)
              .background(RoundedRectangle(cornerRadius: 10).fill(color))
              .frame(width: itemSize, height: itemSize)
              .overlay(
                HStack{
                  Text("\(sampleBingoSheetItem.id)")
                    .font(.system(size: itemSize / 2.5))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                  Text(sampleBingoSheetItem.answer)
                    .font(.system(size: itemSize / 2.5))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                }
                  .padding()
              )
              .onTapGesture {
                selectedItem = sampleBingoSheetItem
              }
              .draggable(sampleBingoSheetItem) {
                RoundedRectangle(cornerRadius: 10)
                  .fill(.ultraThinMaterial)
                  .frame(width: itemSize, height: itemSize)
                  .onAppear{
                    draggingBingoSheetItem = sampleBingoSheetItem
                  }
              }
              .dropDestination(for: BingoSheetItem.self) { items, location in
                draggingBingoSheetItem = nil
                return false
              } isTargeted: { status in
                if let draggingBingoSheetItem, status, draggingBingoSheetItem != sampleBingoSheetItem  {
                  if let draggingIndex = sampleBingoSheetItemList.firstIndex(of:draggingBingoSheetItem),
                     let destinationIndex = sampleBingoSheetItemList.firstIndex(of: sampleBingoSheetItem){
                    withAnimation(.bouncy) {
                      let dropItem = sampleBingoSheetItemList.remove(at: draggingIndex)
                      sampleBingoSheetItemList.insert(dropItem, at:destinationIndex)
                    }
                  }
                }
              }
          }
        })
      }
      .padding(20)
      .navigationTitle("ドラッグ&ドロップ")
      .sheet(item: $selectedItem) { selectedItem in
        AnswerModal(selectedId: selectedItem.id)
      }
    }
  }
}

#Preview {
    BingoSheetView()
}
