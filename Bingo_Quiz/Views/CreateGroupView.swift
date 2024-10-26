import SwiftUI

struct CreateGroupView: View {
  
  private var MAX = 9.0
  @State private var quizTypeRatio = 0.0
  @State private var groupName: String = ""
  @State private var passphrase: String = ""
  
  var body: some View {
    
    VStack(spacing: 20){
      TextFieldWithLabel(label: "グループ名", placeholder: "グループ名を入力してください", text: $groupName)
      TextFieldWithLabel(label: "あいことば", placeholder: "あいことばを入力してください", text: $passphrase)
      VStack(alignment: .leading, spacing: 8) {
        Text("問題形式の比率").font(.headline)
        HStack(alignment: .top) {
          VStack{
            Text("アンケート")
              .multilineTextAlignment(.leading)
              .frame(width: 80)
            Text("\(Int(quizTypeRatio))")
          }
          Slider(
            value: $quizTypeRatio,
            in: 0...MAX,
            step: 1
          )
          VStack{
            Text("通常")
              .multilineTextAlignment(.leading)
              .frame(width: 80)
            Text("\(Int(MAX - quizTypeRatio))")
          }
        }
      }
    }
    .padding(.horizontal,15)
  }
}

#Preview {
  CreateGroupView()
}
