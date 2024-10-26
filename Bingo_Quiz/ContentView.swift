import SwiftUI

struct ContentView: View {
  var body: some View {
    
    VStack(spacing: 0){
      
      ZStack {
        RadialGradient(gradient: Gradient(colors: [Color.blue, Color.black]), center: .center, startRadius: 1, endRadius: 300)
          .ignoresSafeArea()
        VStack{
          VStack{
            Text("ビンゴ & クイズ")
            Text("パーティー")
          }
          .font(.system(.largeTitle, design: .rounded))
          .fontWeight(.black)
          .foregroundColor(Color.yellow)
          .shadow(color: .white, radius: 2, x: 1, y: 1)
          VibrationObject()
        }
        .padding(.top, 90)
        .frame(alignment: .center)
      }
      
      NavigationStack {
        ZStack {
          Color.black
            .edgesIgnoringSafeArea(.all)
          
          GeometryReader { geometry in
            VStack(spacing: 20){
              
              NavigationLink(destination: CreateGroupView()) {
                ButtonWithOutline(
                  text: "新規作成",
                  width: geometry.size.width,
                  height: 70,
                  backgroundColor: Color.white,
                  borderColor: Color.orange,
                  fontSize: .system(.title2, design: .rounded)
                )
                .padding(.top, 10)
              }
              
              HStack(spacing: 10){
                ButtonWithOutline(
                  text: "参加グループ一覧",
                  width:geometry.size.width * 0.7,
                  height: 70,
                  backgroundColor: Color.white,
                  borderColor: Color.orange,
                  fontSize: .system(.title2, design: .rounded)
                )
                ButtonWithOutline(
                  text: "検索",
                  width:geometry.size.width * 0.3,
                  height: 70,
                  backgroundColor: Color.white,
                  borderColor: Color.orange,
                  fontSize: .system(.title2, design: .rounded)
                )
              }
            }
          }
          .padding(.horizontal, 32)
        }
      }
      .frame(height: 200)
    }
  }
}

#Preview {
  ContentView()
}
