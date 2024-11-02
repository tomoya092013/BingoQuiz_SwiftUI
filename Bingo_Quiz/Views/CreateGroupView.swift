import SwiftUI
import PhotosUI

struct CreateGroupView: View {
  
  @Binding public var path:[ContentView.AppPath]
  
  public var MAX = 9.0
  @State public var groupName: String = ""
  @State public var passphrase: String = ""
  @State public var quizTypeRatio = 0.0
  @State var selectedItem: PhotosPickerItem?
  @State var selectedImage: UIImage?
  @State public var imageUrl: String = ""
  @State public var pathName: String = UUID().uuidString
  @State public var isCreated: Bool = false
  public let firebaseStorageService = FirebaseStorageService()
  
  var body: some View {
    
    VStack(spacing: 30){
      TextFieldWithLabel(label: "グループ名", placeholder: "グループ名を入力してください", text: $groupName)
      TextFieldWithLabel(label: "あいことば", placeholder: "あいことばを入力してください", text: $passphrase)
      
      //        VStack() {
      //          HStack(){
      //            Text("アイコン")
      //              .font(.headline)
      //              .frame(maxWidth: .infinity, alignment: .leading)
      //            Button(action: {
      //              Task{
      //                await firebaseStorageService.deleteImage(pathName)
      //              }
      //              selectedImage = nil
      //              selectedItem = nil
      //            }) {
      //              Image(systemName: "xmark.circle.fill")
      //                .foregroundColor(.red)
      //            }
      //          }
      //          PhotosPicker(selection: $selectedItem, matching: .images) {
      //            if let selectedImage = selectedImage {
      //              Image(uiImage: selectedImage)
      //                .resizable()
      //                .scaledToFill()
      //                .frame(width: 150, height: 150)
      //                .clipShape(Circle())
      //            } else {
      //              Text("画像を選択")
      //                .foregroundColor(.white)
      //                .frame(width: 150, height: 150)
      //                .background(Color.gray.opacity(0.5))
      //                .clipShape(Circle())
      //            }
      //          }
      //          .onChange(of: selectedItem) {
      //            Task {
      //              guard let data = try? await selectedItem?.loadTransferable(type: Data.self) else { return }
      //              guard let uiImage = UIImage(data: data) else { return }
      //              selectedImage = uiImage
      //              firebaseStorageService.uploadImage(uiImage, pathName) { downloadURL in
      //                guard let url = downloadURL else {
      //                  selectedImage = nil
      //                  selectedItem = nil
      //                  print("Failed to upload image.")
      //                  return
      //                }
      //                imageUrl = url
      //              }
      //            }
      //          }
      //        }
      
      VStack(alignment: .leading, spacing: 16) {
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
      
      VStack(spacing: 20) {
        Button(action: {
          path.append(.createQuiz)
        }) {
          Text("グループ作成")
            .frame(maxWidth: .infinity, minHeight: 70)
            .background(Color.white)
            .foregroundColor(Color.blue)
            .font(.system(size: 20, design: .rounded))
            .cornerRadius(10)
            .padding()
        }
      }
    }
    .padding(.horizontal,15)
    .navigationTitle("新規グループ作成")
  }
}
