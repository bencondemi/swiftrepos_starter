import SwiftUI

struct ContentView: View {
    
    
  // @ObservedObject instance of ViewModel
    @ObservedObject var viewModel = ViewModel()
  
    @State var searchField: String = ""
    @State var displayedRepos = [Repository]()
    
    
  
  var body: some View {
      let binding = Binding<String>(get: {
          self.searchField
        }, set: {
          self.searchField = $0
          self.viewModel.search(searchText: self.searchField)
          self.displayRepos()
        })
      NavigationView {
          VStack {
              TextField("Search", text: binding)
                  .padding()
              List(displayedRepos) { repo in
                  NavigationLink(destination: WebView(request: URLRequest(url: URL(string: repo.htmlURL)!))) {
                      RepositoryRow(repository: repo)
                  }
              }
              .navigationBarTitle("Swift Repos")
          }
          .onAppear(perform: loadData)
      }
          
  }
    func loadData() {
      Parser().fetchRepositories { (repos) in
        self.viewModel.repos = repos
        self.displayedRepos = repos
      }
    }

    func displayRepos() {
      if searchField == "" {
        displayedRepos = viewModel.repos
      } else {
        displayedRepos = viewModel.filteredRepos
      }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
