import SwiftUI
import PhotosUI

struct CreateGroupView: View {
  
  private var MAX = 9.0
  @State private var groupName: String = ""
  @State private var passphrase: String = ""
  @State private var quizTypeRatio = 0.0
  @State var selectedItem: PhotosPickerItem?
  @State var selectedImage: UIImage?
  
  var body: some View {
    VStack(spacing: 20){
      TextFieldWithLabel(label: "グループ名", placeholder: "グループ名を入力してください", text: $groupName)
      TextFieldWithLabel(label: "あいことば", placeholder: "あいことばを入力してください", text: $passphrase)
      
      VStack() {
        HStack(){
          Text("アイコン")
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
          Button(action: {
            selectedImage = nil
            selectedItem = nil
          }) {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.red)
          }
        }
        PhotosPicker(selection: $selectedItem, matching: .images) {
          if let selectedImage = selectedImage {
            Image(uiImage: selectedImage)
              .resizable()
              .scaledToFill()
              .frame(width: 150, height: 150)
              .clipShape(Circle())
          } else {
            Text("画像を選択")
              .foregroundColor(.white)
              .frame(width: 150, height: 150)
              .background(Color.gray.opacity(0.5))
              .clipShape(Circle())
          }
        }
        .onChange(of: selectedItem) {
          Task {
            guard let data = try? await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let uiImage = UIImage(data: data) else { return }
            selectedImage = uiImage
          }
        }
      }
      
      VStack(alignment: .leading, spacing: 8) {
        Text("問題形式の比率").font(.headline)
        HStack(alignment: .top) {
          VStack{
            Text("アンケート")
              .multilineTextAlignment(.leading)
              .frame(width: 80)
            Text("\(Int(quizTypeRatio))")
          }
          CustomSlider(
            value: $quizTypeRatio,
            range: 0...MAX,
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
