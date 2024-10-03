import Foundation
import Alamofire

class Parser {

  let urlString = "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc"

  // Old way of doing it with completion handlers...
    func fetchRepositories(completionHandler: @escaping ([Repository]) -> Void) {
      AF.request(self.urlString).responseDecodable(of: Repositories.self) { (response) in
        guard let repositories: Repositories = response.value else { return }
        completionHandler(repositories.items)
      }
   }

//   func fetchRepositories() async -> [Repository] {
//     let response = AF.request(self.urlString)
//     let repositories = try? await response.serializingDecodable(Repositories.self).value
//     return repositories?.items ?? []
//   }

}
