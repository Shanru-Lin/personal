import Foundation

class SynopsisLoader: ObservableObject {
    let apiClient: OpenLibraryAPIService
    
    @Published private(set) var state: LoadingState = .idle
    
    enum LoadingState {
        case idle
        case loading
        case success(data: String)
        case failed(error: Error)
    }
    
    init(apiClient: OpenLibraryAPIService) {
        self.apiClient = apiClient
    }
    
    @MainActor
    func loadSynopsisData(book: Book) async {
        self.state = .loading
        do {
            let response = try await apiClient.fetchSynopsis(book)
            self.state = .success(data: response)
        } catch {
            self.state = .failed(error: error)
        }
    }
}
