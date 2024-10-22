import SwiftUI

struct ContentView: View {
  
  @State private var sampleQuizItemList: [QuizItem] = [
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
  
  @State private var draggingQuizItem: QuizItem?
  @State private var showingModal = false
  @State private var selectedId = 0
  
  var body: some View {
    // これをしないと一度目のモーダル遷移で値が渡せない   なぜ。。。
    let _ = print(selectedId)
    
    NavigationStack {
      GeometryReader{ geometry in
        let itemSize = max((geometry.size.width - 40) / 3, 0)
        let columns = Array(repeating: GridItem(spacing: 20), count: 3)
        LazyVGrid(columns: columns, spacing: 20, content: {
          ForEach(sampleQuizItemList, id: \.self.id) { sampleQuizItem in
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color.orange, lineWidth: 6)
              .background(RoundedRectangle(cornerRadius: 10).fill(Color.orange.opacity(0.1)))
              .frame(width: itemSize, height: itemSize)
              .overlay(
                HStack{
                  Text("\(sampleQuizItem.id)")
                    .font(.system(size: itemSize / 2.5))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                  Text(sampleQuizItem.answer)
                    .font(.system(size: itemSize / 2.5))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                }
                  .padding()
              )
              .onTapGesture {
                selectedId = sampleQuizItem.id
                showingModal = true
              }
              .draggable(sampleQuizItem) {
                RoundedRectangle(cornerRadius: 10)
                  .fill(.ultraThinMaterial)
                  .frame(width: itemSize, height: itemSize)
                  .onAppear{
                    draggingQuizItem = sampleQuizItem
                  }
              }
              .dropDestination(for: QuizItem.self) { items, location in
                draggingQuizItem = nil
                return false
              } isTargeted: { status in
                if let draggingQuizItem, status, draggingQuizItem != sampleQuizItem  {
                  if let draggingIndex = sampleQuizItemList.firstIndex(of:draggingQuizItem),
                     let destinationIndex = sampleQuizItemList.firstIndex(of: sampleQuizItem){
                    withAnimation(.bouncy) {
                      let dropItem = sampleQuizItemList.remove(at: draggingIndex)
                      sampleQuizItemList.insert(dropItem, at:destinationIndex)
                    }
                  }
                }
              }
          }
        })
      }
      .padding(20)
      .navigationTitle("ドラッグ&ドロップ")
      .sheet(isPresented: $showingModal) {
        AnswerModal(selectedId: selectedId)
      }
    }
  }
}

#Preview {
  ContentView()
}
