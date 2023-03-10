import SwiftUI

struct TabContainer: View {

    var body: some View {
        TabView{
            NavigationView {
                BookList()
            }
            .tabItem {
                Label("Books", systemImage: "book")
            }
            NavigationView {
                ReadingList()
            }
            .tabItem {
                Label("Reading List", systemImage: "list.star")
            }
        }
    }
}

struct TabContainer_Previews: PreviewProvider {

    static var previews: some View {
        TabContainer().environmentObject(DataStore())
            .environmentObject(SynopsisLoader(apiClient: OpenLibraryAPIServiceClient()))
    }
}
