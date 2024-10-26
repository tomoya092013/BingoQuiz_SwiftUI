import SwiftUI

func createUserId() {
  let userDefaults = UserDefaults.standard
  
  if userDefaults.string(forKey: "userID") == nil {
    let uuid = UUID().uuidString
    userDefaults.set(uuid, forKey: "userID")
    print("NewUUID: \(uuid)")
  } else {
    let existingUUID = userDefaults.string(forKey: "userID")!
    print("ExistingUUID: \(existingUUID)")
  }
}
