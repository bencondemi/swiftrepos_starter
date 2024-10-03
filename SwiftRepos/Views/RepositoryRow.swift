import SwiftUI

struct RepositoryRow: View {
    let repository: Repository
    var body: some View {
      // display a repository's name and decription instead of generic Hello World! text
        VStack(alignment: .leading) {
                    Text(repository.name)
                        .font(.headline)
                    Text(repository.itemDescription)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
  }
}
