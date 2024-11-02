import SwiftUI

struct CreateQuiz: View {
  
  @Binding public var path:[ContentView.AppPath]
  
    var body: some View {
        Text("CreateQuiz")
        .navigationTitle("CreateQuiz")
    }
}
