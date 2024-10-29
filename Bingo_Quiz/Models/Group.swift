import FirebaseFirestore

struct Group: Codable {
  let id: String
  let createUserId: String
  let name: String
  let passPhrase: String
  let surveyCount: Int
  let createDate: String
}
