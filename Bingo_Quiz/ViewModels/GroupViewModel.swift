import SwiftUI

class GroupViewModel: ObservableObject {
  @Published var data: [Group] = []
  
  init() {
    self.data = dataLoad("GroupData.json")
  }
}
