import Foundation

protocol OpenLibraryAPIService {
    func fetchSynopsis(_ book: Book) async throws -> String
}

struct OpenLibraryAPIServiceClient: OpenLibraryAPIService, APIClient {
    let session: URLSession = .shared
    
    func fetchSynopsis(_ book: Book) async throws -> String {
        let path = OpenLibraryEndpoint.path(book.id)
        let response: OpenLibraryResponse = try await performRequest(url: path)
        return response.responseContainer.synopsis
    }
}

