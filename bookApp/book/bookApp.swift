import SwiftUI

@main
struct midtermApp: App {
    @StateObject var bookStore = DataStore()
    @StateObject var synopsisLoader = SynopsisLoader(apiClient: OpenLibraryAPIServiceClient())
    
    var body: some Scene {
        WindowGroup {
            TabContainer()
                .environmentObject(bookStore)
                .environmentObject(synopsisLoader)
        }
    }
}
