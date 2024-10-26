import SwiftUI

struct JoinedGroupsView: View {
  
  // モックデータ取得
  @ObservedObject var GroupVM = GroupViewModel()
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("参加グループ一覧")
        .font(.title2)
        .padding(.top)
      List(GroupVM.data, id: \.id) { group in
        NavigationLink(destination: BingoSheetView()) {
          Text(group.name)
            .listRowBackground(Color.yellow)
        }
      }
      .scrollContentBackground(.hidden)
      .background(Color.blue.opacity(0.3))
    }
  }
}

#Preview {
  JoinedGroupsView()
}
