import FirebaseStorage
import SwiftUI

class ImageUploader {
  func uploadImage(_ image: UIImage, _ pathName: String, completion: @escaping (String?) -> Void) {
    guard let imageData = image.jpegData(compressionQuality: 0.8) else {
      completion(nil)
      return
    }
    
    let storage = Storage.storage()
    let storageRef = storage.reference()
    let imageRef = storageRef.child("images/\(pathName).jpg")
    
    imageRef.putData(imageData, metadata: nil) { (metadata, error) in
      guard error == nil else {
        print("Error uploading image: \(error!.localizedDescription)")
        completion(nil)
        return
      }
      
      imageRef.downloadURL { (url, error) in
        guard let downloadURL = url else {
          print("Error fetching download URL: \(error?.localizedDescription ?? "Unknown error")")
          completion(nil)
          return
        }
        
        completion(downloadURL.absoluteString)
      }
    }
  }
}
