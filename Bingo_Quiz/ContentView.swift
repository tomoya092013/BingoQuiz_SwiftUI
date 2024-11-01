import SwiftUI

struct ContentView: View {
  
  public enum AppPath {
    case newGroup, createQuiz, groupList
  }
  @State public var navigatePath: [AppPath] = []
  
  var body: some View {
    NavigationStack(path: $navigatePath) {
      
      ZStack {
        RadialGradient(
          gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.yellow.opacity(0.5), Color.blue.opacity(0.2)]),
          center: .center,
          startRadius: 1,
          endRadius: 300)
        .ignoresSafeArea()
        
        SnowParticle(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        GeometryReader { geometry in
          VStack {
            VStack(spacing: 1) {
              Text("BINGO")
                .foregroundColor(Color.pink)
              Text("&")
                .foregroundColor(Color.blue)
              Text("QUIZ")
                .foregroundColor(Color.orange)
              BingoObject()
            }
            .font(.system(size: 60, design: .rounded))
            .fontWeight(.black)
            .shadow(color: .yellow, radius: 2, x: 1, y: 2)
            
            Spacer()
            
            VStack(spacing: 10) {
              ButtonWithOutline(
                text: "新規作成",
                width: geometry.size.width * 0.8,
                height: 70,
                backgroundColor: Color.white,
                borderColor: Color.orange,
                fontSize: .system(.title2, design: .rounded)
              )
              .padding(.top, 10)
              .onTapGesture {
                navigatePath.append(.newGroup)
              }
              
              HStack(spacing: 10) {
                ButtonWithOutline(
                  text: "参加グループ一覧",
                  width: geometry.size.width * 0.5,
                  height: 70,
                  backgroundColor: Color.white,
                  borderColor: Color.orange,
                  fontSize: .system(.title2, design: .rounded)
                )
                .onTapGesture {
                  navigatePath.append(.groupList)
                }
                ButtonWithOutline(
                  text: "検索",
                  width: geometry.size.width * 0.3,
                  height: 70,
                  backgroundColor: Color.white,
                  borderColor: Color.orange,
                  fontSize: .system(.title2, design: .rounded)
                )
              }
            }
          }
          .padding(.top, 40)
          .frame(maxWidth: .infinity, alignment: .center)
        }
      }
      .navigationDestination(for: AppPath.self) { path in
        switch path {
        case .newGroup:
          CreateGroupView(path: $navigatePath)
        case .createQuiz:
          CreateQuiz(path: $navigatePath)
        case .groupList:
          JoinedGroupsView(path: $navigatePath)
          
        }
      }
    }
  }
}
